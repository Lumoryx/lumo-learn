/// App-wide constants.
class AppConstants {
  AppConstants._();

  static const appName = 'Lumo Learn';
  static const appTagline = 'Your AI English habit, in 5 minutes a day.';

  // Subscription
  static const trialDays = 14;
  static const monthlyPriceUsd = 6.99;
  static const annualPriceUsd = 39.99;

  // Learning limits
  static const freeWordsPerDay = 5;
  static const proWordsPerDay = 10;
  static const freeVocabLimit = 30;
  static const proFreezeCardsPerMonth = 3;

  // Loyalty reward
  static const loyaltyStreakDays = 30;

  // Milestone streaks
  static const milestoneStreaks = [7, 30, 60, 90, 100];

  // AI
  static const maxDailyGenerations = 1;
  static const maxDailyWordLookups = 10;
}
