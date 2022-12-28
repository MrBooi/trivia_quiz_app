class Configs {
  /// The max allowed duration for http cache
  ///
  static const Duration maxCacheAge = Duration(hours: 1);

  /// Key used in dio options to indicate whether
  /// cache should be force refreshed
  static const String dioCacheForceRefreshKey = 'dio_cache_force_refresh_key';

  /// BASE API URL of [OpenTrivia] API
  ///
  /// see: https://opentdb.com/api.php
  static const String apiBaseUrl = "https://opentdb.com";

  /// List of total number of questions per quiz
  ///
  static const List<int> totalNumberOfQuiz = [10, 20, 30, 40, 50];
}
