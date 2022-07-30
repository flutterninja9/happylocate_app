import 'package:dartz/dartz.dart';
import 'package:happylocate_app/core/cache_service/cache_service.dart';
import 'package:happylocate_app/core/cache_service/exceptions.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: CacheService)
class SharedPrefCacheServiceImpl implements CacheService {
  final SharedPreferences prefs;

  SharedPrefCacheServiceImpl({
    required this.prefs,
  });
  @override
  Future<Unit> deleteData(String key) async {
    return _safeCallBack(() async {
      if (prefs.containsKey(key)) {
        await prefs.remove(key);
        return unit;
      }
      throw CacheException('Key -> $key does not exist');
    });
  }

  @override
  Future<String> getData(String key) async {
    return _safeCallBack(() async {
      if (prefs.containsKey(key)) {
        final result = prefs.getString(key);
        if (result != null) {
          return result;
        }
        throw CacheException('No data found at $key');
      }
      throw CacheException('Key -> $key does not exist');
    });
  }

  @override
  Future<Unit> setData(String key, String value) async {
    return _safeCallBack(() async {
      await prefs.setString(key, value);
      return unit;
    });
  }

  Future<T> _safeCallBack<T>(Future<T> Function() callback) async {
    try {
      return await callback();
    } catch (e) {
      throw CacheException(e.toString());
    }
  }
}
