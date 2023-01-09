class GeneralException implements Exception {
  final String message;

  GeneralException({required this.message});
}

class SocketException implements Exception {
  SocketException();
}

class ServerException implements Exception {
  ServerException();
}

class CacheException implements Exception {}
