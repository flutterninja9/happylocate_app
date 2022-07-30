// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'inventory_listing_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InventoryListingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getInventory,
    required TResult Function(InventoryItem item) updateInventoryItem,
    required TResult Function(InventoryItem item) deleteItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getInventory,
    TResult Function(InventoryItem item)? updateInventoryItem,
    TResult Function(InventoryItem item)? deleteItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getInventory,
    TResult Function(InventoryItem item)? updateInventoryItem,
    TResult Function(InventoryItem item)? deleteItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetInventory value) getInventory,
    required TResult Function(_UpdateInventoryItem value) updateInventoryItem,
    required TResult Function(_DeleteItem value) deleteItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetInventory value)? getInventory,
    TResult Function(_UpdateInventoryItem value)? updateInventoryItem,
    TResult Function(_DeleteItem value)? deleteItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetInventory value)? getInventory,
    TResult Function(_UpdateInventoryItem value)? updateInventoryItem,
    TResult Function(_DeleteItem value)? deleteItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryListingEventCopyWith<$Res> {
  factory $InventoryListingEventCopyWith(InventoryListingEvent value,
          $Res Function(InventoryListingEvent) then) =
      _$InventoryListingEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$InventoryListingEventCopyWithImpl<$Res>
    implements $InventoryListingEventCopyWith<$Res> {
  _$InventoryListingEventCopyWithImpl(this._value, this._then);

  final InventoryListingEvent _value;
  // ignore: unused_field
  final $Res Function(InventoryListingEvent) _then;
}

/// @nodoc
abstract class _$$_GetInventoryCopyWith<$Res> {
  factory _$$_GetInventoryCopyWith(
          _$_GetInventory value, $Res Function(_$_GetInventory) then) =
      __$$_GetInventoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetInventoryCopyWithImpl<$Res>
    extends _$InventoryListingEventCopyWithImpl<$Res>
    implements _$$_GetInventoryCopyWith<$Res> {
  __$$_GetInventoryCopyWithImpl(
      _$_GetInventory _value, $Res Function(_$_GetInventory) _then)
      : super(_value, (v) => _then(v as _$_GetInventory));

  @override
  _$_GetInventory get _value => super._value as _$_GetInventory;
}

/// @nodoc

class _$_GetInventory implements _GetInventory {
  const _$_GetInventory();

  @override
  String toString() {
    return 'InventoryListingEvent.getInventory()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetInventory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getInventory,
    required TResult Function(InventoryItem item) updateInventoryItem,
    required TResult Function(InventoryItem item) deleteItem,
  }) {
    return getInventory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getInventory,
    TResult Function(InventoryItem item)? updateInventoryItem,
    TResult Function(InventoryItem item)? deleteItem,
  }) {
    return getInventory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getInventory,
    TResult Function(InventoryItem item)? updateInventoryItem,
    TResult Function(InventoryItem item)? deleteItem,
    required TResult orElse(),
  }) {
    if (getInventory != null) {
      return getInventory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetInventory value) getInventory,
    required TResult Function(_UpdateInventoryItem value) updateInventoryItem,
    required TResult Function(_DeleteItem value) deleteItem,
  }) {
    return getInventory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetInventory value)? getInventory,
    TResult Function(_UpdateInventoryItem value)? updateInventoryItem,
    TResult Function(_DeleteItem value)? deleteItem,
  }) {
    return getInventory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetInventory value)? getInventory,
    TResult Function(_UpdateInventoryItem value)? updateInventoryItem,
    TResult Function(_DeleteItem value)? deleteItem,
    required TResult orElse(),
  }) {
    if (getInventory != null) {
      return getInventory(this);
    }
    return orElse();
  }
}

abstract class _GetInventory implements InventoryListingEvent {
  const factory _GetInventory() = _$_GetInventory;
}

/// @nodoc
abstract class _$$_UpdateInventoryItemCopyWith<$Res> {
  factory _$$_UpdateInventoryItemCopyWith(_$_UpdateInventoryItem value,
          $Res Function(_$_UpdateInventoryItem) then) =
      __$$_UpdateInventoryItemCopyWithImpl<$Res>;
  $Res call({InventoryItem item});
}

/// @nodoc
class __$$_UpdateInventoryItemCopyWithImpl<$Res>
    extends _$InventoryListingEventCopyWithImpl<$Res>
    implements _$$_UpdateInventoryItemCopyWith<$Res> {
  __$$_UpdateInventoryItemCopyWithImpl(_$_UpdateInventoryItem _value,
      $Res Function(_$_UpdateInventoryItem) _then)
      : super(_value, (v) => _then(v as _$_UpdateInventoryItem));

  @override
  _$_UpdateInventoryItem get _value => super._value as _$_UpdateInventoryItem;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_$_UpdateInventoryItem(
      item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as InventoryItem,
    ));
  }
}

/// @nodoc

class _$_UpdateInventoryItem implements _UpdateInventoryItem {
  const _$_UpdateInventoryItem(this.item);

  @override
  final InventoryItem item;

  @override
  String toString() {
    return 'InventoryListingEvent.updateInventoryItem(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateInventoryItem &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateInventoryItemCopyWith<_$_UpdateInventoryItem> get copyWith =>
      __$$_UpdateInventoryItemCopyWithImpl<_$_UpdateInventoryItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getInventory,
    required TResult Function(InventoryItem item) updateInventoryItem,
    required TResult Function(InventoryItem item) deleteItem,
  }) {
    return updateInventoryItem(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getInventory,
    TResult Function(InventoryItem item)? updateInventoryItem,
    TResult Function(InventoryItem item)? deleteItem,
  }) {
    return updateInventoryItem?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getInventory,
    TResult Function(InventoryItem item)? updateInventoryItem,
    TResult Function(InventoryItem item)? deleteItem,
    required TResult orElse(),
  }) {
    if (updateInventoryItem != null) {
      return updateInventoryItem(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetInventory value) getInventory,
    required TResult Function(_UpdateInventoryItem value) updateInventoryItem,
    required TResult Function(_DeleteItem value) deleteItem,
  }) {
    return updateInventoryItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetInventory value)? getInventory,
    TResult Function(_UpdateInventoryItem value)? updateInventoryItem,
    TResult Function(_DeleteItem value)? deleteItem,
  }) {
    return updateInventoryItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetInventory value)? getInventory,
    TResult Function(_UpdateInventoryItem value)? updateInventoryItem,
    TResult Function(_DeleteItem value)? deleteItem,
    required TResult orElse(),
  }) {
    if (updateInventoryItem != null) {
      return updateInventoryItem(this);
    }
    return orElse();
  }
}

abstract class _UpdateInventoryItem implements InventoryListingEvent {
  const factory _UpdateInventoryItem(final InventoryItem item) =
      _$_UpdateInventoryItem;

  InventoryItem get item;
  @JsonKey(ignore: true)
  _$$_UpdateInventoryItemCopyWith<_$_UpdateInventoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteItemCopyWith<$Res> {
  factory _$$_DeleteItemCopyWith(
          _$_DeleteItem value, $Res Function(_$_DeleteItem) then) =
      __$$_DeleteItemCopyWithImpl<$Res>;
  $Res call({InventoryItem item});
}

/// @nodoc
class __$$_DeleteItemCopyWithImpl<$Res>
    extends _$InventoryListingEventCopyWithImpl<$Res>
    implements _$$_DeleteItemCopyWith<$Res> {
  __$$_DeleteItemCopyWithImpl(
      _$_DeleteItem _value, $Res Function(_$_DeleteItem) _then)
      : super(_value, (v) => _then(v as _$_DeleteItem));

  @override
  _$_DeleteItem get _value => super._value as _$_DeleteItem;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_$_DeleteItem(
      item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as InventoryItem,
    ));
  }
}

/// @nodoc

class _$_DeleteItem implements _DeleteItem {
  const _$_DeleteItem(this.item);

  @override
  final InventoryItem item;

  @override
  String toString() {
    return 'InventoryListingEvent.deleteItem(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteItem &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  _$$_DeleteItemCopyWith<_$_DeleteItem> get copyWith =>
      __$$_DeleteItemCopyWithImpl<_$_DeleteItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getInventory,
    required TResult Function(InventoryItem item) updateInventoryItem,
    required TResult Function(InventoryItem item) deleteItem,
  }) {
    return deleteItem(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getInventory,
    TResult Function(InventoryItem item)? updateInventoryItem,
    TResult Function(InventoryItem item)? deleteItem,
  }) {
    return deleteItem?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getInventory,
    TResult Function(InventoryItem item)? updateInventoryItem,
    TResult Function(InventoryItem item)? deleteItem,
    required TResult orElse(),
  }) {
    if (deleteItem != null) {
      return deleteItem(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetInventory value) getInventory,
    required TResult Function(_UpdateInventoryItem value) updateInventoryItem,
    required TResult Function(_DeleteItem value) deleteItem,
  }) {
    return deleteItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetInventory value)? getInventory,
    TResult Function(_UpdateInventoryItem value)? updateInventoryItem,
    TResult Function(_DeleteItem value)? deleteItem,
  }) {
    return deleteItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetInventory value)? getInventory,
    TResult Function(_UpdateInventoryItem value)? updateInventoryItem,
    TResult Function(_DeleteItem value)? deleteItem,
    required TResult orElse(),
  }) {
    if (deleteItem != null) {
      return deleteItem(this);
    }
    return orElse();
  }
}

abstract class _DeleteItem implements InventoryListingEvent {
  const factory _DeleteItem(final InventoryItem item) = _$_DeleteItem;

  InventoryItem get item;
  @JsonKey(ignore: true)
  _$$_DeleteItemCopyWith<_$_DeleteItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InventoryListingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<InventoryItem> items) loaded,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<InventoryItem> items)? loaded,
    TResult Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<InventoryItem> items)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryListingStateCopyWith<$Res> {
  factory $InventoryListingStateCopyWith(InventoryListingState value,
          $Res Function(InventoryListingState) then) =
      _$InventoryListingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InventoryListingStateCopyWithImpl<$Res>
    implements $InventoryListingStateCopyWith<$Res> {
  _$InventoryListingStateCopyWithImpl(this._value, this._then);

  final InventoryListingState _value;
  // ignore: unused_field
  final $Res Function(InventoryListingState) _then;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$InventoryListingStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'InventoryListingState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<InventoryItem> items) loaded,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<InventoryItem> items)? loaded,
    TResult Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<InventoryItem> items)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements InventoryListingState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  $Res call({List<InventoryItem> items});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$InventoryListingStateCopyWithImpl<$Res>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, (v) => _then(v as _$_Loaded));

  @override
  _$_Loaded get _value => super._value as _$_Loaded;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_$_Loaded(
      items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InventoryItem>,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(final List<InventoryItem> items) : _items = items;

  final List<InventoryItem> _items;
  @override
  List<InventoryItem> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'InventoryListingState.loaded(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<InventoryItem> items) loaded,
    required TResult Function(String message) failure,
  }) {
    return loaded(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<InventoryItem> items)? loaded,
    TResult Function(String message)? failure,
  }) {
    return loaded?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<InventoryItem> items)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements InventoryListingState {
  const factory _Loaded(final List<InventoryItem> items) = _$_Loaded;

  List<InventoryItem> get items;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailureCopyWith<$Res> {
  factory _$$_FailureCopyWith(
          _$_Failure value, $Res Function(_$_Failure) then) =
      __$$_FailureCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$_FailureCopyWithImpl<$Res>
    extends _$InventoryListingStateCopyWithImpl<$Res>
    implements _$$_FailureCopyWith<$Res> {
  __$$_FailureCopyWithImpl(_$_Failure _value, $Res Function(_$_Failure) _then)
      : super(_value, (v) => _then(v as _$_Failure));

  @override
  _$_Failure get _value => super._value as _$_Failure;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_Failure(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Failure implements _Failure {
  const _$_Failure(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'InventoryListingState.failure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failure &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      __$$_FailureCopyWithImpl<_$_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<InventoryItem> items) loaded,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<InventoryItem> items)? loaded,
    TResult Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<InventoryItem> items)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements InventoryListingState {
  const factory _Failure(final String message) = _$_Failure;

  String get message;
  @JsonKey(ignore: true)
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}
