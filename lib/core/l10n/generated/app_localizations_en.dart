import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Lumo Learn';

  @override
  String get appTagline => 'Your AI English habit, in 5 minutes a day.';

  @override
  String get authTitle => 'Welcome to\nLumo Learn';

  @override
  String get authSubtitle => 'Start your 14-day free Pro trial';

  @override
  String get authContinueWithApple => 'Continue with Apple';

  @override
  String get authContinueWithGoogle => 'Continue with Google';

  @override
  String get authOrDivider => 'or';

  @override
  String get authEmailPlaceholder => 'Email address';

  @override
  String get authPasswordPlaceholder => 'Password';

  @override
  String get authSignInWithEmail => 'Sign in with Email';

  @override
  String get authNoAccount => 'Don\'t have an account? Sign up';

  @override
  String get authTermsNote => 'By continuing you agree to our Terms of Service';

  @override
  String onboardingStep(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get onboardingGoalTitle => 'Why are you learning English?';

  @override
  String get onboardingGoalTravel => 'Travel';

  @override
  String get onboardingGoalCareer => 'Career';

  @override
  String get onboardingGoalExam => 'Exam Prep';

  @override
  String get onboardingGoalImmigration => 'Immigration';

  @override
  String get onboardingGoalInterest => 'Just for fun';

  @override
  String get onboardingLevelTitle => 'What\'s your English level?';

  @override
  String get onboardingLevelBeginner => 'Beginner';

  @override
  String get onboardingLevelBeginnerSub => 'Just starting out';

  @override
  String get onboardingLevelElementary => 'Elementary';

  @override
  String get onboardingLevelElementarySub => 'Basic conversations';

  @override
  String get onboardingLevelIntermediate => 'Intermediate';

  @override
  String get onboardingLevelIntermediateSub => 'Read & write well';

  @override
  String get onboardingLevelAdvanced => 'Advanced';

  @override
  String get onboardingLevelAdvancedSub => 'Near native';

  @override
  String get onboardingInterestsTitle => 'Pick your favorite topics';

  @override
  String get onboardingInterestsSubtitle => 'Choose up to 3';

  @override
  String get onboardingInterestsTech => 'Technology';

  @override
  String get onboardingInterestsBusiness => 'Business';

  @override
  String get onboardingInterestsCulture => 'Culture';

  @override
  String get onboardingInterestsSports => 'Sports';

  @override
  String get onboardingInterestsEntertainment => 'Entertainment';

  @override
  String get onboardingInterestsTravel => 'Travel';

  @override
  String get onboardingInterestsScience => 'Science';

  @override
  String get onboardingInterestsFood => 'Food & Cooking';

  @override
  String get onboardingContinue => 'Continue';

  @override
  String get onboardingPrivacyNote => '🔒 Your data is private and never sold';

  @override
  String get welcomeProTitle => 'You\'re Pro!';

  @override
  String get welcomeProSubtitle => '14-day free trial activated';

  @override
  String get welcomeProUnlocked => 'What you unlocked:';

  @override
  String get welcomeProFeatureAi => 'Full AI-personalized content';

  @override
  String get welcomeProFeatureFreeze => 'Streak freeze cards (3/month)';

  @override
  String get welcomeProFeatureThemes => 'All 4 premium themes';

  @override
  String get welcomeProFeatureStats => 'Complete learning analytics';

  @override
  String get welcomeProFeatureNoAds => 'Zero ads, ever';

  @override
  String get welcomeProCta => 'Start Learning →';

  @override
  String get welcomeProDisclaimer => 'No credit card needed · Cancel anytime';

  @override
  String get homeGreetingMorning => 'Good morning ☀️';

  @override
  String get homeGreetingAfternoon => 'Good afternoon 🌤';

  @override
  String get homeGreetingEvening => 'Good evening 🌙';

  @override
  String homeStreakDay(int count) {
    return 'Day $count streak 🔥';
  }

  @override
  String get homeTodayTheme => 'Today\'s Theme';

  @override
  String homeWordsCardTitle(int count) {
    return '$count Words';
  }

  @override
  String get homeWordsCardCta => 'Start Learning →';

  @override
  String get homeArticleCardTitle => 'Article';

  @override
  String homeArticleCardReadTime(int min, String level) {
    return '~$min min · $level';
  }

  @override
  String get homeArticleCardCta => 'Read Now →';

  @override
  String get homeThisWeek => 'This Week';

  @override
  String homeLoyaltyProgress(int days) {
    return 'Keep going for $days more days to earn your FREE month!';
  }

  @override
  String homeLoyaltyDays(int done, int total) {
    return '$done/$total days';
  }

  @override
  String get flashcardTapToReveal => 'Tap to reveal';

  @override
  String get flashcardListen => '🔊 Listen';

  @override
  String get flashcardForgot => '✗  Forgot';

  @override
  String get flashcardGotIt => '✓  Got it!';

  @override
  String flashcardProgress(int current, int total) {
    return '$current / $total';
  }

  @override
  String get articleListenAll => '🔊 Listen';

  @override
  String get articleMarkWord => 'Add to vocabulary';

  @override
  String get articleDone => 'Done Reading ✓';

  @override
  String celebrateTitle(int day) {
    return 'Day $day Complete! 🔥';
  }

  @override
  String celebrateSubtitle(int words) {
    return 'You learned $words words today\nand read 1 article.';
  }

  @override
  String get celebrateShare => '📤  Share Your Progress';

  @override
  String get celebrateHome => '→ Continue to Home';

  @override
  String get paywallTitle => 'Unlock Your Full\nLearning Potential';

  @override
  String get paywallTrialBadge => '14-day free trial';

  @override
  String get paywallMonthly => 'Monthly';

  @override
  String get paywallMonthlyPrice => '\$6.99/mo';

  @override
  String get paywallAnnual => 'Annual';

  @override
  String get paywallAnnualPrice => '\$39.99/yr';

  @override
  String get paywallAnnualSaving => 'Save 52%';

  @override
  String get paywallCta => 'Start Free Trial';

  @override
  String get paywallDisclaimer => 'Cancel anytime · No charge during trial';

  @override
  String get paywallRestore => 'Restore Purchase';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsProfile => 'Profile';

  @override
  String get settingsTheme => 'Theme & Appearance';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsSubscription => 'Subscription';

  @override
  String get settingsHelp => 'Help & Feedback';

  @override
  String get settingsSignOut => 'Sign Out';

  @override
  String get themeTitle => 'Theme';

  @override
  String get themeAppearance => 'Appearance';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeUnlockedByStreaks => 'Unlocked by Streaks';

  @override
  String themeLocked(int days) {
    return '🔒 $days days';
  }
}
