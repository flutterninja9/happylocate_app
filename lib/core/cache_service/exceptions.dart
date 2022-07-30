class CacheException implements Exception {
  final String message;

  CacheException(this.message);

  @override
  String toString() => "CacheException: $message";
}

class KeyDoesNotExistException implements CacheException {
  @override
  final String message;

  KeyDoesNotExistException(this.message);

  @override
  String toString() => "KeyDoesNotExistException: $message";
}
