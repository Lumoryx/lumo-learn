import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Lumo Learn'**
  String get appName;

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'Your AI English habit, in 5 minutes a day.'**
  String get appTagline;

  /// No description provided for @authTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to\nLumo Learn'**
  String get authTitle;

  /// No description provided for @authSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Start your 14-day free Pro trial'**
  String get authSubtitle;

  /// No description provided for @authContinueWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get authContinueWithApple;

  /// No description provided for @authContinueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get authContinueWithGoogle;

  /// No description provided for @authOrDivider.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get authOrDivider;

  /// No description provided for @authEmailPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get authEmailPlaceholder;

  /// No description provided for @authPasswordPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPasswordPlaceholder;

  /// No description provided for @authSignInWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Email'**
  String get authSignInWithEmail;

  /// No description provided for @authNoAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Sign up'**
  String get authNoAccount;

  /// No description provided for @authTermsNote.
  ///
  /// In en, this message translates to:
  /// **'By continuing you agree to our Terms of Service'**
  String get authTermsNote;

  /// No description provided for @onboardingStep.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String onboardingStep(int current, int total);

  /// No description provided for @onboardingGoalTitle.
  ///
  /// In en, this message translates to:
  /// **'Why are you learning English?'**
  String get onboardingGoalTitle;

  /// No description provided for @onboardingGoalTravel.
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get onboardingGoalTravel;

  /// No description provided for @onboardingGoalCareer.
  ///
  /// In en, this message translates to:
  /// **'Career'**
  String get onboardingGoalCareer;

  /// No description provided for @onboardingGoalExam.
  ///
  /// In en, this message translates to:
  /// **'Exam Prep'**
  String get onboardingGoalExam;

  /// No description provided for @onboardingGoalImmigration.
  ///
  /// In en, this message translates to:
  /// **'Immigration'**
  String get onboardingGoalImmigration;

  /// No description provided for @onboardingGoalInterest.
  ///
  /// In en, this message translates to:
  /// **'Just for fun'**
  String get onboardingGoalInterest;

  /// No description provided for @onboardingLevelTitle.
  ///
  /// In en, this message translates to:
  /// **'What\'s your English level?'**
  String get onboardingLevelTitle;

  /// No description provided for @onboardingLevelBeginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get onboardingLevelBeginner;

  /// No description provided for @onboardingLevelBeginnerSub.
  ///
  /// In en, this message translates to:
  /// **'Just starting out'**
  String get onboardingLevelBeginnerSub;

  /// No description provided for @onboardingLevelElementary.
  ///
  /// In en, this message translates to:
  /// **'Elementary'**
  String get onboardingLevelElementary;

  /// No description provided for @onboardingLevelElementarySub.
  ///
  /// In en, this message translates to:
  /// **'Basic conversations'**
  String get onboardingLevelElementarySub;

  /// No description provided for @onboardingLevelIntermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get onboardingLevelIntermediate;

  /// No description provided for @onboardingLevelIntermediateSub.
  ///
  /// In en, this message translates to:
  /// **'Read & write well'**
  String get onboardingLevelIntermediateSub;

  /// No description provided for @onboardingLevelAdvanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get onboardingLevelAdvanced;

  /// No description provided for @onboardingLevelAdvancedSub.
  ///
  /// In en, this message translates to:
  /// **'Near native'**
  String get onboardingLevelAdvancedSub;

  /// No description provided for @onboardingInterestsTitle.
  ///
  /// In en, this message translates to:
  /// **'Pick your favorite topics'**
  String get onboardingInterestsTitle;

  /// No description provided for @onboardingInterestsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose up to 3'**
  String get onboardingInterestsSubtitle;

  /// No description provided for @onboardingInterestsTech.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get onboardingInterestsTech;

  /// No description provided for @onboardingInterestsBusiness.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get onboardingInterestsBusiness;

  /// No description provided for @onboardingInterestsCulture.
  ///
  /// In en, this message translates to:
  /// **'Culture'**
  String get onboardingInterestsCulture;

  /// No description provided for @onboardingInterestsSports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get onboardingInterestsSports;

  /// No description provided for @onboardingInterestsEntertainment.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get onboardingInterestsEntertainment;

  /// No description provided for @onboardingInterestsTravel.
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get onboardingInterestsTravel;

  /// No description provided for @onboardingInterestsScience.
  ///
  /// In en, this message translates to:
  /// **'Science'**
  String get onboardingInterestsScience;

  /// No description provided for @onboardingInterestsFood.
  ///
  /// In en, this message translates to:
  /// **'Food & Cooking'**
  String get onboardingInterestsFood;

  /// No description provided for @onboardingContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboardingContinue;

  /// No description provided for @onboardingPrivacyNote.
  ///
  /// In en, this message translates to:
  /// **'🔒 Your data is private and never sold'**
  String get onboardingPrivacyNote;

  /// No description provided for @welcomeProTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re Pro!'**
  String get welcomeProTitle;

  /// No description provided for @welcomeProSubtitle.
  ///
  /// In en, this message translates to:
  /// **'14-day free trial activated'**
  String get welcomeProSubtitle;

  /// No description provided for @welcomeProUnlocked.
  ///
  /// In en, this message translates to:
  /// **'What you unlocked:'**
  String get welcomeProUnlocked;

  /// No description provided for @welcomeProFeatureAi.
  ///
  /// In en, this message translates to:
  /// **'Full AI-personalized content'**
  String get welcomeProFeatureAi;

  /// No description provided for @welcomeProFeatureFreeze.
  ///
  /// In en, this message translates to:
  /// **'Streak freeze cards (3/month)'**
  String get welcomeProFeatureFreeze;

  /// No description provided for @welcomeProFeatureThemes.
  ///
  /// In en, this message translates to:
  /// **'All 4 premium themes'**
  String get welcomeProFeatureThemes;

  /// No description provided for @welcomeProFeatureStats.
  ///
  /// In en, this message translates to:
  /// **'Complete learning analytics'**
  String get welcomeProFeatureStats;

  /// No description provided for @welcomeProFeatureNoAds.
  ///
  /// In en, this message translates to:
  /// **'Zero ads, ever'**
  String get welcomeProFeatureNoAds;

  /// No description provided for @welcomeProCta.
  ///
  /// In en, this message translates to:
  /// **'Start Learning →'**
  String get welcomeProCta;

  /// No description provided for @welcomeProDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'No credit card needed · Cancel anytime'**
  String get welcomeProDisclaimer;

  /// No description provided for @homeGreetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning ☀️'**
  String get homeGreetingMorning;

  /// No description provided for @homeGreetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon 🌤'**
  String get homeGreetingAfternoon;

  /// No description provided for @homeGreetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening 🌙'**
  String get homeGreetingEvening;

  /// No description provided for @homeStreakDay.
  ///
  /// In en, this message translates to:
  /// **'Day {count} streak 🔥'**
  String homeStreakDay(int count);

  /// No description provided for @homeTodayTheme.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Theme'**
  String get homeTodayTheme;

  /// No description provided for @homeWordsCardTitle.
  ///
  /// In en, this message translates to:
  /// **'{count} Words'**
  String homeWordsCardTitle(int count);

  /// No description provided for @homeWordsCardCta.
  ///
  /// In en, this message translates to:
  /// **'Start Learning →'**
  String get homeWordsCardCta;

  /// No description provided for @homeArticleCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Article'**
  String get homeArticleCardTitle;

  /// No description provided for @homeArticleCardReadTime.
  ///
  /// In en, this message translates to:
  /// **'~{min} min · {level}'**
  String homeArticleCardReadTime(int min, String level);

  /// No description provided for @homeArticleCardCta.
  ///
  /// In en, this message translates to:
  /// **'Read Now →'**
  String get homeArticleCardCta;

  /// No description provided for @homeThisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get homeThisWeek;

  /// No description provided for @homeLoyaltyProgress.
  ///
  /// In en, this message translates to:
  /// **'Keep going for {days} more days to earn your FREE month!'**
  String homeLoyaltyProgress(int days);

  /// No description provided for @homeLoyaltyDays.
  ///
  /// In en, this message translates to:
  /// **'{done}/{total} days'**
  String homeLoyaltyDays(int done, int total);

  /// No description provided for @flashcardTapToReveal.
  ///
  /// In en, this message translates to:
  /// **'Tap to reveal'**
  String get flashcardTapToReveal;

  /// No description provided for @flashcardListen.
  ///
  /// In en, this message translates to:
  /// **'🔊 Listen'**
  String get flashcardListen;

  /// No description provided for @flashcardForgot.
  ///
  /// In en, this message translates to:
  /// **'✗  Forgot'**
  String get flashcardForgot;

  /// No description provided for @flashcardGotIt.
  ///
  /// In en, this message translates to:
  /// **'✓  Got it!'**
  String get flashcardGotIt;

  /// No description provided for @flashcardProgress.
  ///
  /// In en, this message translates to:
  /// **'{current} / {total}'**
  String flashcardProgress(int current, int total);

  /// No description provided for @articleListenAll.
  ///
  /// In en, this message translates to:
  /// **'🔊 Listen'**
  String get articleListenAll;

  /// No description provided for @articleMarkWord.
  ///
  /// In en, this message translates to:
  /// **'Add to vocabulary'**
  String get articleMarkWord;

  /// No description provided for @articleDone.
  ///
  /// In en, this message translates to:
  /// **'Done Reading ✓'**
  String get articleDone;

  /// No description provided for @celebrateTitle.
  ///
  /// In en, this message translates to:
  /// **'Day {day} Complete! 🔥'**
  String celebrateTitle(int day);

  /// No description provided for @celebrateSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You learned {words} words today\nand read 1 article.'**
  String celebrateSubtitle(int words);

  /// No description provided for @celebrateShare.
  ///
  /// In en, this message translates to:
  /// **'📤  Share Your Progress'**
  String get celebrateShare;

  /// No description provided for @celebrateHome.
  ///
  /// In en, this message translates to:
  /// **'→ Continue to Home'**
  String get celebrateHome;

  /// No description provided for @paywallTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock Your Full\nLearning Potential'**
  String get paywallTitle;

  /// No description provided for @paywallTrialBadge.
  ///
  /// In en, this message translates to:
  /// **'14-day free trial'**
  String get paywallTrialBadge;

  /// No description provided for @paywallMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get paywallMonthly;

  /// No description provided for @paywallMonthlyPrice.
  ///
  /// In en, this message translates to:
  /// **'\$6.99/mo'**
  String get paywallMonthlyPrice;

  /// No description provided for @paywallAnnual.
  ///
  /// In en, this message translates to:
  /// **'Annual'**
  String get paywallAnnual;

  /// No description provided for @paywallAnnualPrice.
  ///
  /// In en, this message translates to:
  /// **'\$39.99/yr'**
  String get paywallAnnualPrice;

  /// No description provided for @paywallAnnualSaving.
  ///
  /// In en, this message translates to:
  /// **'Save 52%'**
  String get paywallAnnualSaving;

  /// No description provided for @paywallCta.
  ///
  /// In en, this message translates to:
  /// **'Start Free Trial'**
  String get paywallCta;

  /// No description provided for @paywallDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Cancel anytime · No charge during trial'**
  String get paywallDisclaimer;

  /// No description provided for @paywallRestore.
  ///
  /// In en, this message translates to:
  /// **'Restore Purchase'**
  String get paywallRestore;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get settingsProfile;

  /// No description provided for @settingsTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme & Appearance'**
  String get settingsTheme;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// No description provided for @settingsSubscription.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get settingsSubscription;

  /// No description provided for @settingsHelp.
  ///
  /// In en, this message translates to:
  /// **'Help & Feedback'**
  String get settingsHelp;

  /// No description provided for @settingsSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get settingsSignOut;

  /// No description provided for @themeTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeTitle;

  /// No description provided for @themeAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get themeAppearance;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @themeUnlockedByStreaks.
  ///
  /// In en, this message translates to:
  /// **'Unlocked by Streaks'**
  String get themeUnlockedByStreaks;

  /// No description provided for @themeLocked.
  ///
  /// In en, this message translates to:
  /// **'🔒 {days} days'**
  String themeLocked(int days);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
