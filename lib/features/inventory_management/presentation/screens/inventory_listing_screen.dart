import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happylocate_app/core/widgets/hl_empty_state.dart';
import 'package:happylocate_app/core/widgets/hl_scaffold.dart';
import 'package:happylocate_app/di.dart';
import 'package:happylocate_app/features/inventory_management/presentation/bloc/inventory_listing_bloc.dart';
import 'package:happylocate_app/features/inventory_management/presentation/screens/inventory_item_saved_screen.dart';
import 'package:happylocate_app/features/inventory_management/presentation/screens/inventory_manual_entry_form.dart';
import 'package:happylocate_app/features/inventory_management/presentation/widgets/inventory_view.dart';

class InventoryListingScreen extends StatefulWidget {
  const InventoryListingScreen({Key? key}) : super(key: key);

  @override
  State<InventoryListingScreen> createState() => _InventoryListingScreenState();
}

class _InventoryListingScreenState extends State<InventoryListingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<InventoryListingBloc>()
        ..add(const InventoryListingEvent.getInventory()),
      child: HlScaffold(
        appBarTitle: 'Inventory listing',
        // Because of bottomsheet's extra content shift
        applyDefaultPadding: false,
        page: BlocBuilder<InventoryListingBloc, InventoryListingState>(
          builder: (context, state) {
            return state.map(
              loading: (_) => const Center(child: CircularProgressIndicator()),
              inventoryEmpty: (_) => HlEmptyState(
                label: 'Your inventory is empty',
                actionBtnLabel: 'Add inventory',
                onTapAction: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return InventoryManualEntryForm(
                        onAdd: (item) {
                          context
                              .read<InventoryListingBloc>()
                              .add(InventoryListingEvent.addItem(item));
                        },
                      );
                    },
                  );
                },
              ),
              loaded: (state) => InventoryView(
                items: state.items,
                onCheckout: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const InventoryItemSavedScreen()),
                  );
                },
                onItemRemoved: (item) => context
                    .read<InventoryListingBloc>()
                    .add(InventoryListingEvent.deleteItem(item)),
                onQuantityChanged: (item, qty) => context
                    .read<InventoryListingBloc>()
                    .add(InventoryListingEvent.updateInventoryItemQty(
                        item, qty)),
                onAddManually: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return InventoryManualEntryForm(
                        onAdd: (item) {
                          context
                              .read<InventoryListingBloc>()
                              .add(InventoryListingEvent.addItem(item));
                        },
                      );
                    },
                  );
                },
              ),
              failure: (state) => Center(child: Text(state.message)),
            );
          },
        ),
      ),
    );
  }
}
