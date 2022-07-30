import 'package:dartz/dartz.dart';

/// Responsible for caching of String objects
/// throws [CacheException] in case of error
/// throws [KeyDoesNotExistException] in case of key does not exist
abstract class CacheService {
  Future<String> getData(String key);
  Future<Unit> setData(String key, String value);
  Future<Unit> deleteData(String key);
}
