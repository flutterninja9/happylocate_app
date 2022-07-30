import 'package:flutter/material.dart';
import 'package:happylocate_app/core/extensions/build_context.dart';
import 'package:happylocate_app/core/widgets/hl_scaffold.dart';
import 'package:happylocate_app/features/inventory_management/presentation/screens/inventory_listing_screen.dart';

class InventoryItemScannerScreen extends StatelessWidget {
  const InventoryItemScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HlScaffold(
      appBarTitle: 'Camera View',
      page: Column(
        children: [
          Container(
            height: context.height * 0.8,
            width: context.width,
            decoration: const BoxDecoration(color: Colors.black),
            child: const Center(
              child: Text('Camera View', style: TextStyle(color: Colors.white)),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Start Recording'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const InventoryListingScreen(),
                      ),
                    );
                  },
                  child: const Text('Stop Recording'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
