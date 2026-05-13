import { serve } from 'https://deno.land/std@0.168.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const supabase = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
    )

    // Auth: get user from JWT
    const authHeader = req.headers.get('Authorization')!
    const { data: { user }, error: authError } = await supabase.auth.getUser(
      authHeader.replace('Bearer ', '')
    )
    if (authError || !user) {
      return new Response(JSON.stringify({ error: 'Unauthorized' }), {
        status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' }
      })
    }

    // Check if today's content already exists
    const today = new Date().toISOString().split('T')[0]
    const { data: existing } = await supabase
      .from('daily_content')
      .select('*')
      .eq('user_id', user.id)
      .eq('date', today)
      .single()

    if (existing) {
      return new Response(JSON.stringify(existing), {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' }
      })
    }

    // Get user preferences
    const { data: prefs } = await supabase
      .from('user_preferences')
      .select('*')
      .eq('user_id', user.id)
      .single()

    // Get user profile (subscription tier)
    const { data: profile } = await supabase
      .from('profiles')
      .select('subscription')
      .eq('id', user.id)
      .single()

    const isPro = profile?.subscription === 'pro'
    const wordCount = isPro ? 10 : 5

    // Get system AI config from Vault
    const { data: aiConfig } = await supabase
      .from('system_ai_config')
      .select('api_key, model')
      .eq('is_active', true)
      .single()

    if (!aiConfig) {
      return new Response(JSON.stringify({ error: 'AI not configured' }), {
        status: 503, headers: { ...corsHeaders, 'Content-Type': 'application/json' }
      })
    }

    // Build prompt
    const prompt = buildPrompt({ prefs, isPro, wordCount })

    // Call OpenAI
    const openaiRes = await fetch('https://api.openai.com/v1/chat/completions', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${aiConfig.api_key}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        model: aiConfig.model || 'gpt-4o-mini',
        messages: [{ role: 'user', content: prompt }],
        response_format: { type: 'json_object' },
        temperature: 0.8,
      }),
    })

    const openaiData = await openaiRes.json()
    const content = JSON.parse(openaiData.choices[0].message.content)

    // Save to daily_content
    const { data: saved, error: saveError } = await supabase
      .from('daily_content')
      .insert({
        user_id: user.id,
        date: today,
        topic_theme: content.theme,
        words: content.words,
        article_title: content.article.title,
        article_body: content.article.body,
        article_level: content.article.level,
        generated_at: new Date().toISOString(),
      })
      .select()
      .single()

    if (saveError) throw saveError

    return new Response(JSON.stringify(saved), {
      headers: { ...corsHeaders, 'Content-Type': 'application/json' }
    })

  } catch (err) {
    return new Response(JSON.stringify({ error: err.message }), {
      status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' }
    })
  }
})

function buildPrompt({ prefs, isPro, wordCount }: { prefs: any, isPro: boolean, wordCount: number }) {
  if (!isPro) {
    return `Generate ${wordCount} English vocabulary words with a single unified theme.
Output JSON: { "theme": "string", "words": [{ "word", "phonetic", "meaning_cn", "meaning_en", "example", "difficulty" }], "article": { "title", "body" (150 words), "level" } }`
  }

  const level = prefs?.current_level || 'intermediate'
  const interests = prefs?.interests?.join(', ') || 'general'
  const goal = prefs?.learning_goals?.[0] || 'general improvement'
  const lang = prefs?.ui_language || 'zh'

  return `You are a professional English learning content designer.

User Profile:
- Level: ${level}
- Interests: ${interests}
- Learning Goal: ${goal}
- UI Language: ${lang}

Generate today's learning content with a UNIFIED THEME connecting words and article.

Output JSON:
{
  "theme": "string (today's topic)",
  "words": [
    {
      "word": "string",
      "phonetic": "string (IPA)",
      "meaning_cn": "string",
      "meaning_en": "string",
      "example": "string",
      "difficulty": "easy|medium|hard"
    }
  ],
  "article": {
    "title": "string",
    "body": "string (200-250 words, ${level} difficulty)",
    "level": "string"
  }
}

RULES:
- Exactly ${wordCount} words, all related to the theme
- Words and article must share the same theme
- Words should appear naturally in the article
- Do NOT repeat themes from the past 7 days`
}
