-- Enable pgsodium for Vault encryption
create extension if not exists pgsodium;

-- ── profiles ────────────────────────────────────────────────────────────────
create table public.profiles (
  id              uuid primary key references auth.users(id) on delete cascade,
  username        text,
  avatar_url      text,
  subscription    text not null default 'free' check (subscription in ('free','trial','pro')),
  trial_ends_at   timestamptz,
  streak_count    int not null default 0,
  streak_freeze   int not null default 0,
  created_at      timestamptz not null default now()
);

alter table public.profiles enable row level security;

create policy "Users can view own profile"
  on public.profiles for select using (auth.uid() = id);

create policy "Users can update own profile"
  on public.profiles for update using (auth.uid() = id);

-- Auto-create profile on signup
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  insert into public.profiles (id, username, created_at)
  values (new.id, new.raw_user_meta_data->>'name', now());
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- ── user_preferences ────────────────────────────────────────────────────────
create table public.user_preferences (
  id              uuid primary key default gen_random_uuid(),
  user_id         uuid not null references public.profiles(id) on delete cascade,
  learning_goals  text[] default '{}',
  current_level   text not null default 'beginner'
                  check (current_level in ('beginner','elementary','intermediate','advanced')),
  interests       text[] default '{}',
  ui_language     text not null default 'zh',
  theme           text not null default 'midnight',
  dark_mode       text not null default 'system'
                  check (dark_mode in ('system','light','dark')),
  notify_enabled  boolean not null default true,
  notify_time     time,
  onboarding_done boolean not null default false,
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now(),
  unique (user_id)
);

alter table public.user_preferences enable row level security;

create policy "Users can manage own preferences"
  on public.user_preferences for all using (auth.uid() = user_id);

-- ── system_ai_config ────────────────────────────────────────────────────────
-- api_key stored via Supabase Vault; never exposed to client
create table public.system_ai_config (
  id          uuid primary key default gen_random_uuid(),
  provider    text not null default 'openai',
  api_key     text not null,  -- Vault-encrypted via pgsodium
  model       text not null default 'gpt-4o-mini',
  is_active   boolean not null default true,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);

-- Only service role can read (RLS: deny all client access)
alter table public.system_ai_config enable row level security;
-- No policies = all client access denied; Edge Function uses service role

-- ── daily_content ────────────────────────────────────────────────────────────
create table public.daily_content (
  id              uuid primary key default gen_random_uuid(),
  user_id         uuid not null references public.profiles(id) on delete cascade,
  date            date not null,
  topic_theme     text not null,
  words           jsonb not null default '[]',
  article_title   text not null,
  article_body    text not null,
  article_level   text not null,
  generated_at    timestamptz not null default now(),
  unique (user_id, date)
);

alter table public.daily_content enable row level security;

create policy "Users can read own daily content"
  on public.daily_content for select using (auth.uid() = user_id);

create policy "Service can insert daily content"
  on public.daily_content for insert with check (true); -- Edge Function uses service role

-- ── learning_records ────────────────────────────────────────────────────────
create table public.learning_records (
  id                  uuid primary key default gen_random_uuid(),
  user_id             uuid not null references public.profiles(id) on delete cascade,
  date                date not null,
  words_completed     boolean not null default false,
  words_count         int not null default 0,
  article_done        boolean not null default false,
  streak_used_freeze  boolean not null default false,
  completed_at        timestamptz,
  unique (user_id, date)
);

alter table public.learning_records enable row level security;

create policy "Users can manage own learning records"
  on public.learning_records for all using (auth.uid() = user_id);

-- ── streak_milestones ────────────────────────────────────────────────────────
create table public.streak_milestones (
  id           uuid primary key default gen_random_uuid(),
  user_id      uuid not null references public.profiles(id) on delete cascade,
  milestone    int not null,  -- 7 | 30 | 100 | ...
  unlocked_at  timestamptz not null default now(),
  reward_type  text  -- 'theme' | 'badge' | 'freeze_card'
);

alter table public.streak_milestones enable row level security;

create policy "Users can read own milestones"
  on public.streak_milestones for select using (auth.uid() = user_id);

-- ── loyalty_rewards ──────────────────────────────────────────────────────────
create table public.loyalty_rewards (
  id                  uuid primary key default gen_random_uuid(),
  user_id             uuid not null references public.profiles(id) on delete cascade,
  streak_milestone    int not null,   -- 30 | 60 | 90 | ...
  reward_month_free   int not null default 1,
  billing_period      text,
  revenuecat_promo_id text,
  status              text not null default 'pending'
                      check (status in ('pending','applied','failed')),
  applied_at          timestamptz,
  created_at          timestamptz not null default now()
);

alter table public.loyalty_rewards enable row level security;

create policy "Users can read own loyalty rewards"
  on public.loyalty_rewards for select using (auth.uid() = user_id);

-- ── share_cards ──────────────────────────────────────────────────────────────
create table public.share_cards (
  id           uuid primary key default gen_random_uuid(),
  user_id      uuid not null references public.profiles(id) on delete cascade,
  shared_at    timestamptz not null default now(),
  platform     text,  -- 'instagram'|'twitter'|'wechat'|'copy'
  streak_day   int
);

alter table public.share_cards enable row level security;

create policy "Users can insert own share cards"
  on public.share_cards for insert with check (auth.uid() = user_id);
