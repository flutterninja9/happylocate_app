import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:happylocate_app/core/app/typography.dart';
import 'package:happylocate_app/core/extensions/build_context.dart';
import 'package:happylocate_app/core/widgets/hl_scaffold.dart';
import 'package:happylocate_app/features/inventory_management/presentation/screens/inventory_item_scanner_screen.dart';
import 'package:happylocate_app/features/inventory_management/presentation/widgets/cta_btn.dart';

class InventoryHomescreen extends StatelessWidget {
  const InventoryHomescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HlScaffold(
      appBarTitle: 'Inventory',
      page: Column(
        children: [
          const SizedBox(height: 24),
          DottedBorder(
            color: Colors.grey,
            dashPattern: const [15],
            radius: const Radius.circular(8),
            borderType: BorderType.RRect,
            child: SizedBox(
              height: context.height * 0.4,
              width: context.width,
              child:
                  Center(child: Text('Save your inventory', style: headline4)),
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
