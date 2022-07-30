// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import 'core/cache_service/cache_service.dart' as _i4;
import 'core/cache_service/sp_cache_service_impl.dart' as _i5;
import 'di.dart' as _i15;
import 'features/inventory_management/data/data_sources/inventory_local_data_source.dart'
    as _i6;
import 'features/inventory_management/data/data_sources/inventory_local_data_source_impl.dart'
    as _i7;
import 'features/inventory_management/data/repositories/inventory_repository_impl.dart'
    as _i9;
import 'features/inventory_management/domain/repositories/inventory_repository.dart'
    as _i8;
import 'features/inventory_management/domain/usecases/add_inventory_item.dart'
    as _i11;
import 'features/inventory_management/domain/usecases/delete_inventory_item.dart'
    as _i12;
import 'features/inventory_management/domain/usecases/get_inventory_items.dart'
    as _i13;
import 'features/inventory_management/domain/usecases/update_inventory_item.dart'
    as _i10;
import 'features/inventory_management/presentation/bloc/inventory_listing_bloc.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i3.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i4.CacheService>(() =>
      _i5.SharedPrefCacheServiceImpl(prefs: get<_i3.SharedPreferences>()));
  gh.lazySingleton<_i6.InventoryLocalDataSource>(() =>
      _i7.InventoryLocalDataSourceImpl(cacheService: get<_i4.CacheService>()));
  gh.lazySingleton<_i8.InventoryRepository>(() => _i9.InventoryRepositoryImpl(
      localDataSource: get<_i6.InventoryLocalDataSource>()));
  gh.lazySingleton<_i10.UpdateInventoryItem>(() =>
      _i10.UpdateInventoryItem(repository: get<_i8.InventoryRepository>()));
  gh.lazySingleton<_i11.AddInventoryItem>(
      () => _i11.AddInventoryItem(repository: get<_i8.InventoryRepository>()));
  gh.lazySingleton<_i12.DeleteInventoryItem>(() =>
      _i12.DeleteInventoryItem(repository: get<_i8.InventoryRepository>()));
  gh.lazySingleton<_i13.GetInventoryItems>(
      () => _i13.GetInventoryItems(repository: get<_i8.InventoryRepository>()));
  gh.factory<_i14.InventoryListingBloc>(() => _i14.InventoryListingBloc(
      get<_i13.GetInventoryItems>(),
      get<_i11.AddInventoryItem>(),
      get<_i12.DeleteInventoryItem>()));
  return get;
}

class _$RegisterModule extends _i15.RegisterModule {}
