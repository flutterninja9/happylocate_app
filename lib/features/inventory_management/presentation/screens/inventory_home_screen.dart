import 'package:flutter/material.dart';
import 'package:happylocate_app/core/app/typography.dart';
import 'package:happylocate_app/core/extensions/build_context.dart';
import 'package:happylocate_app/features/inventory_management/presentation/screens/inventory_item_scanner_screen.dart';
import 'package:happylocate_app/features/inventory_management/presentation/widgets/cta_btn.dart';

class InventoryHomescreen extends StatelessWidget {
  const InventoryHomescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory', style: headline),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Container(
            height: context.height * 0.4,
            width: context.width,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Center(
              child: Text('Save your inventory', style: headline4),
            ),
          ),
          const SizedBox(height: 36),
          CTAButton(
            label: 'Start listing',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const InventoryItemScannerScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
