import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/core/configs/configs.dart';

void main() {
  group('App config file', () {
    test('Should return true if maxCacheAge is equal to [1 hour].', () {
      const expected = Duration(hours: 1);
      expect(Configs.maxCacheAge, expected);
    });

    test(
        'Should return true if dioCacheForceRefreshKey is equal to [dio_cache_force_refresh_key].',
        () {
      const expected = 'dio_cache_force_refresh_key';
      expect(Configs.dioCacheForceRefreshKey, expected);
    });

    test('Should return true if apiBaseUrl is equal to [https://opentdb.com].',
        () {
      const expected = 'https://opentdb.com';
      expect(Configs.apiBaseUrl, expected);
    });

    test(
        'Should return true if totalNumberOfQuiz is equal to [10,20,30,40,50].',
        () {
      const expected = [10, 20, 30, 40, 50];
      expect(Configs.totalNumberOfQuiz, expected);
    });
  });
}
