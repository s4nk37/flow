class ServerException implements Exception {
  final String? message;
  ServerException({this.message});
}

class CacheException implements Exception {}

class PermissionException implements Exception {}
