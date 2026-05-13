import 'app_localizations.dart';

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'Lumo Learn';

  @override
  String get appTagline => '你的 AI 英语习惯，每天只需 5 分钟。';

  @override
  String get authTitle => '欢迎来到\nLumo Learn';

  @override
  String get authSubtitle => '开启 14 天 Pro 免费体验';

  @override
  String get authContinueWithApple => '使用 Apple 登录';

  @override
  String get authContinueWithGoogle => '使用 Google 登录';

  @override
  String get authOrDivider => '或';

  @override
  String get authEmailPlaceholder => '电子邮箱';

  @override
  String get authPasswordPlaceholder => '密码';

  @override
  String get authSignInWithEmail => '使用邮箱登录';

  @override
  String get authNoAccount => '没有账号？立即注册';

  @override
  String get authTermsNote => '继续即表示您同意我们的服务条款';

  @override
  String onboardingStep(int current, int total) {
    return '第 $current 步，共 $total 步';
  }

  @override
  String get onboardingGoalTitle => '你学英语最想做什么？';

  @override
  String get onboardingGoalTravel => '旅行';

  @override
  String get onboardingGoalCareer => '职业晋升';

  @override
  String get onboardingGoalExam => '考试备考';

  @override
  String get onboardingGoalImmigration => '移居海外';

  @override
  String get onboardingGoalInterest => '纯粹喜欢';

  @override
  String get onboardingLevelTitle => '你的英语水平大概是？';

  @override
  String get onboardingLevelBeginner => '入门';

  @override
  String get onboardingLevelBeginnerSub => '刚开始学习';

  @override
  String get onboardingLevelElementary => '基础';

  @override
  String get onboardingLevelElementarySub => '能进行日常对话';

  @override
  String get onboardingLevelIntermediate => '中级';

  @override
  String get onboardingLevelIntermediateSub => '读写比较流利';

  @override
  String get onboardingLevelAdvanced => '高级';

  @override
  String get onboardingLevelAdvancedSub => '接近母语水平';

  @override
  String get onboardingInterestsTitle => '选择你感兴趣的话题';

  @override
  String get onboardingInterestsSubtitle => '最多选 3 个';

  @override
  String get onboardingInterestsTech => '科技';

  @override
  String get onboardingInterestsBusiness => '商业';

  @override
  String get onboardingInterestsCulture => '文化';

  @override
  String get onboardingInterestsSports => '体育';

  @override
  String get onboardingInterestsEntertainment => '娱乐';

  @override
  String get onboardingInterestsTravel => '旅行';

  @override
  String get onboardingInterestsScience => '科学';

  @override
  String get onboardingInterestsFood => '美食';

  @override
  String get onboardingContinue => '继续';

  @override
  String get onboardingPrivacyNote => '🔒 你的数据完全私密，绝不出售';

  @override
  String get welcomeProTitle => '你已升级 Pro！';

  @override
  String get welcomeProSubtitle => '14 天免费体验已激活';

  @override
  String get welcomeProUnlocked => '你解锁了：';

  @override
  String get welcomeProFeatureAi => '完整 AI 个性化内容';

  @override
  String get welcomeProFeatureFreeze => 'Streak 冻结卡（每月 3 张）';

  @override
  String get welcomeProFeatureThemes => '全部 4 套高端主题';

  @override
  String get welcomeProFeatureStats => '完整学习数据统计';

  @override
  String get welcomeProFeatureNoAds => '零广告，永久';

  @override
  String get welcomeProCta => '开始学习 →';

  @override
  String get welcomeProDisclaimer => '无需信用卡 · 随时取消';

  @override
  String get homeGreetingMorning => '早上好 ☀️';

  @override
  String get homeGreetingAfternoon => '下午好 🌤';

  @override
  String get homeGreetingEvening => '晚上好 🌙';

  @override
  String homeStreakDay(int count) {
    return '连续 $count 天 🔥';
  }

  @override
  String get homeTodayTheme => '今日主题';

  @override
  String homeWordsCardTitle(int count) {
    return '$count 个单词';
  }

  @override
  String get homeWordsCardCta => '开始学习 →';

  @override
  String get homeArticleCardTitle => '今日短文';

  @override
  String homeArticleCardReadTime(int min, String level) {
    return '约 $min 分钟 · $level';
  }

  @override
  String get homeArticleCardCta => '立即阅读 →';

  @override
  String get homeThisWeek => '本周记录';

  @override
  String homeLoyaltyProgress(int days) {
    return '再坚持 $days 天即可免单下月会员！';
  }

  @override
  String homeLoyaltyDays(int done, int total) {
    return '$done/$total 天';
  }

  @override
  String get flashcardTapToReveal => '点击查看释义';

  @override
  String get flashcardListen => '🔊 朗读';

  @override
  String get flashcardForgot => '✗  不认识';

  @override
  String get flashcardGotIt => '✓  认识了！';

  @override
  String flashcardProgress(int current, int total) {
    return '$current / $total';
  }

  @override
  String get articleListenAll => '🔊 朗读全文';

  @override
  String get articleMarkWord => '加入生词本';

  @override
  String get articleDone => '已读完 ✓';

  @override
  String celebrateTitle(int day) {
    return '第 $day 天打卡成功！🔥';
  }

  @override
  String celebrateSubtitle(int words) {
    return '今天学了 $words 个单词\n并完成了 1 篇短文。';
  }

  @override
  String get celebrateShare => '📤  分享我的进度';

  @override
  String get celebrateHome => '→ 返回首页';

  @override
  String get paywallTitle => '解锁完整\n学习潜能';

  @override
  String get paywallTrialBadge => '14 天免费体验';

  @override
  String get paywallMonthly => '月付';

  @override
  String get paywallMonthlyPrice => '¥49.99/月';

  @override
  String get paywallAnnual => '年付';

  @override
  String get paywallAnnualPrice => '¥279.99/年';

  @override
  String get paywallAnnualSaving => '省 52%';

  @override
  String get paywallCta => '开启免费体验';

  @override
  String get paywallDisclaimer => '随时取消 · 体验期内不收费';

  @override
  String get paywallRestore => '恢复购买';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsProfile => '个人资料';

  @override
  String get settingsTheme => '主题与外观';

  @override
  String get settingsLanguage => '语言';

  @override
  String get settingsNotifications => '通知';

  @override
  String get settingsSubscription => '订阅管理';

  @override
  String get settingsHelp => '帮助与反馈';

  @override
  String get settingsSignOut => '退出登录';

  @override
  String get themeTitle => '主题';

  @override
  String get themeAppearance => '外观';

  @override
  String get themeSystem => '跟随系统';

  @override
  String get themeLight => '浅色';

  @override
  String get themeDark => '深色';

  @override
  String get themeUnlockedByStreaks => 'Streak 里程碑解锁';

  @override
  String themeLocked(int days) {
    return '🔒 $days 天';
  }
}
