import 'package:flutter/material.dart';
import 'package:happylocate_app/core/app/color_pallete.dart';
import 'package:happylocate_app/core/app/typography.dart';

class InventoryItemSavedScreen extends StatelessWidget {
  const InventoryItemSavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.done, color: secondaryColor, size: 96),
            const SizedBox(height: 16),
            Text("Inventory Saved", style: title),
            const SizedBox(height: 8),
            Text("We’ve sent you an email.", style: body1),
            const SizedBox(height: 67),
            SizedBox(
              height: 40,
              width: 140,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text("Home"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
