import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:happylocate_app/core/usecase/usecase.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/inventory_item.dart';
import 'package:happylocate_app/features/inventory_management/domain/usecases/get_inventory_items.dart';
import 'package:injectable/injectable.dart';

part 'inventory_listing_bloc.freezed.dart';
part 'inventory_listing_event.dart';
part 'inventory_listing_state.dart';

@injectable
class InventoryListingBloc
    extends Bloc<InventoryListingEvent, InventoryListingState> {
  final GetInventoryItems getInventoryItems;
  InventoryListingBloc(this.getInventoryItems) : super(const _Loading()) {
    on<InventoryListingEvent>(
      (event, emit) => event.map(
        getInventory: (eventData) async => _handleGetInventory(eventData, emit),
        deleteItem: (eventData) async => _handleDeleteItem(eventData, emit),
        updateInventoryItem: (eventData) async =>
            _handleUpdateInventoryItem(eventData, emit),
      ),
    );
  }

  Future<void> _handleGetInventory(
    _GetInventory event,
    Emitter<InventoryListingState> emit,
  ) async {
    emit(const _Loading());
    await Future.delayed(const Duration(seconds: 1));
    final failureOrResult = await getInventoryItems(NoParams());
    emit(failureOrResult.fold(
      (f) {
        return _Failure(f.message);
      },
      (r) {
        return _Loaded(r);
      },
    ));
    return;
  }

  Future<void> _handleDeleteItem(
    _DeleteItem event,
    Emitter<InventoryListingState> emit,
  ) async {
    emit(const _Loading());
    await Future.delayed(const Duration(seconds: 1));
    final failureOrResult = await getInventoryItems(NoParams());
    emit(failureOrResult.fold(
      (f) {
        return _Failure(f.message);
      },
      (r) {
        return _Loaded(r);
      },
    ));
    return;
  }

  Future<void> _handleUpdateInventoryItem(
    _UpdateInventoryItem event,
    Emitter<InventoryListingState> emit,
  ) async {
    emit(const _Loading());
    await Future.delayed(const Duration(seconds: 1));
    final failureOrResult = await getInventoryItems(NoParams());
    emit(failureOrResult.fold(
      (f) {
        return _Failure(f.message);
      },
      (r) {
        return _Loaded(r);
      },
    ));
    return;
  }
}
