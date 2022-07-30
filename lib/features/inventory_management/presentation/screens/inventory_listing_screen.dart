import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happylocate_app/core/widgets/hl_scaffold.dart';
import 'package:happylocate_app/di.dart';
import 'package:happylocate_app/features/inventory_management/presentation/bloc/inventory_listing_bloc.dart';
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
              loaded: (state) => InventoryView(items: state.items),
              failure: (state) => Center(child: Text(state.message)),
            );
          },
        ),
      ),
    );
  }
}
