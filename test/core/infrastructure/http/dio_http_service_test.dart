import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:opentrivia/core/configs/configs.dart';
import 'package:opentrivia/core/exceptions/http_exception.dart';
import 'package:opentrivia/core/infrastructure/http/dio_http_service.dart';

void main() {
  late DioHttpService dioHttpService;
  late DioAdapter dioAdapter;

  setUp(() {
    dioAdapter = DioAdapter(
      dio: Dio(
        BaseOptions(
          baseUrl: Configs.apiBaseUrl,
          // To handle errors manually rather than by Dio
          validateStatus: (status) => true,
          headers: <String, dynamic>{
            'accept': 'application/json',
            'content-type': 'application/json'
          },
        ),
      ),
    );
    dioHttpService = DioHttpService(dioOverride: dioAdapter.dio);
  });

  test('Should call Get Request successfully.', () async {
    const mockGetRoute = 'mock-get-route';
    const mockResponse = {'data': 'success!'};
    dioAdapter.onGet(
      mockGetRoute,
      (server) => server.reply(200, mockResponse),
    );

    final response = await dioHttpService.get(mockGetRoute);

    expect(response, mockResponse);
  });

  test('Should throw an [ServerException] if status code is 404.', () async {
    const mockGetRoute = 'mock-get-route';
    const mockResponse = {'error': '404 Error!'};
    dioAdapter.onGet(
      mockGetRoute,
      (server) => server.reply(404, mockResponse),
    );

    expect(
      () => dioHttpService.get(mockGetRoute),
      throwsA(
        isA<ServerException>(),
      ),
    );
  });

  test('Should throw an [ServerException] if status code is 404.', () async {
    const mockGetRoute = 'mock-get-route';
    const mockResponse = {'error': '404 Error!'};
    dioAdapter.onGet(
      mockGetRoute,
      (server) => server.reply(404, mockResponse),
    );

    expect(
      () => dioHttpService.get(mockGetRoute),
      throwsA(
        isA<ServerException>(),
      ),
    );
  });

  test('Should throw an [ServerException] if no internet connection.',
      () async {
    const mockGetRoute = 'mock-get-route';
    dioAdapter.onGet(
      mockGetRoute,
      (server) => server.throws(
        404,
        DioError(
          requestOptions: RequestOptions(path: mockGetRoute),
          error: {'message': ''},
        ),
      ),
    );

    expect(
      () => dioHttpService.get(mockGetRoute),
      throwsA(
        isA<ServerException>(),
      ),
    );
  });

  test('Should throw an [SocketException] if no internet connection.',
      () async {
    const mockGetRoute = 'mock-get-route';
    dioAdapter.onGet(
      mockGetRoute,
      (server) => server.throws(
        404,
        DioError(
          requestOptions: RequestOptions(path: mockGetRoute),
          error: {'message': 'SocketException'},
        ),
      ),
    );

    expect(
      () => dioHttpService.get(mockGetRoute),
      throwsA(
        isA<SocketException>(),
      ),
    );
  });

  test('httpServiceProvider is a DioHttpService', () {
    final providerContainer = ProviderContainer();

    addTearDown(providerContainer.dispose);

    expect(
      providerContainer.read(httpServiceProvider),
      isA<DioHttpService>(),
    );
  });
}
