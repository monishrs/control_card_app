/// Base URL for News API.
///
/// Loaded from environment variable:
/// `NEWS_BASE_URL`
///
/// Falls back to:
/// `https://newsapi.org/v2`
const String baseUrl =
String.fromEnvironment(
  'NEWS_BASE_URL',
  defaultValue:
  'https://newsapi.org/v2',
);

/// API key for News API.
///
/// Loaded from environment variable:
/// `NEWS_API_KEY`
const String newsAPIKey =
String.fromEnvironment(
  'NEWS_API_KEY',
);

/// Default country query used
/// for fetching news.
///
/// Loaded from environment variable:
/// `NEWS_COUNTRY`
///
/// Falls back to:
/// `us`
const String countryQuery =
String.fromEnvironment(
  'NEWS_COUNTRY',
  defaultValue: 'us',
);

/// Default news category query.
///
/// Loaded from environment variable:
/// `NEWS_CATEGORY`
///
/// Falls back to:
/// `general`
const String categoryQuery =
String.fromEnvironment(
  'NEWS_CATEGORY',
  defaultValue: 'general',
);

/// Application-wide static constants.
class AppConstants {
  /// Session lock status text.
  static const String
  sessionLockedYou =
      'SESSION LOCKED • YOU';

  /// Sample information text
  /// for WiFi Vernier.
  static const String
  sampleNWifiVernier =
      'sample n=5 • WiFi Vernier';

  /// Offline crimping status text.
  static const String
  offlineCrimping =
      'OFFLINE • CRIMPING CRM-03';

  static const String liveVernier = 'LIVE • VERNIER';
  static const String firstOffGate = 'FIRST-OFF GATE';
  static const String awaitingTlQc = 'Awaiting TL + QC';
  static const String callQc = 'Call QC';
  static const String stageLog = 'STAGE LOG';
  static const String raiseBreakdown = 'Raise breakdown';
  static const String pause = 'Pause';
  static const String submitStage04 = 'Submit stage 04 →';
  static const String lastReading = 'LAST READING';
  static const String standard = 'STANDARD';
  static const String method = 'METHOD';
  static const String sample = 'SAMPLE';
  static const String withinTol = 'WITHIN TOL';
  static const String spec = 'SPEC';
  static const String wifiVernier5Samples = 'WIFI VERNIER - 5 SAMPLES';
  static const String taken = 'TAKEN';
  static const String ng = 'NG';
}