import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/core/configs/configs.dart';
import 'package:opentrivia/core/exceptions/http_exception.dart';
import 'package:opentrivia/core/infrastructure/http/http_service.dart';

class DioHttpService implements HttpService {
  DioHttpService({
    Dio? dioOverride,
    bool enableCaching = true,
  }) {
    dio = dioOverride ?? Dio(baseOptions);
  }

  /// The Dio Http client
  late final Dio dio;

  /// The Dio base options
  BaseOptions get baseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  @override
  String get baseUrl => Configs.apiBaseUrl;

  @override
  Map<String, String> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
  }) async {
    try {
      final Response<dynamic> response = await dio.get<Map<String, dynamic>>(
        endpoint,
        queryParameters: queryParameters,
      );
      if (response.data == null || response.statusCode != 200) {
        throw GeneralException(
          message: response.data['message'],
        );
      }

      return response.data as Map<String, dynamic>;
    } on GeneralException catch (_) {
      rethrow;
    } on DioError catch (error) {
      switch (error.type) {
        case DioErrorType.other:
          if (error.message.contains('SocketException')) {
            throw SocketException();
          } else {
            throw ServerException();
          }
        case DioErrorType.response:
        default:
          throw GeneralException(message: error.response?.data['error']);
      }
    } catch (e) {
      throw ServerException();
    }
  }
}

/// Provider that maps an [HttpService] interface to implementation
final httpServiceProvider = Provider<HttpService>((ref) {
  return DioHttpService();
});
