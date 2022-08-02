import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:happylocate_app/core/app/consts.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/inventory_item.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/item_type.dart';
import 'package:happylocate_app/features/inventory_management/presentation/widgets/inventory_form.dart';

void main() {
  late final Widget form;
  final tInventoryItem = InventoryItem.empty();

  setUpAll(() {
    form = MaterialApp(
      home: Material(
        child: Center(
          child: InventoryForm(
            item: tInventoryItem,
            onNameChanged: (name) {},
            onDimensionHeightChanged: (height) {},
            onDimensionWidthChanged: (width) {},
            onQtyChanged: (qty) {},
            onItemTypeChanged: (type) {},
            onEditComplete: (item) {},
          ),
        ),
      ),
    );
  });

  group('[STRUCTURE]', () {
    testWidgets(
      'form should have 3 [TextFormField] widgets',
      (tester) async {
        // arrange
        await tester.pumpWidget(form);

        // assert
        expect(find.byType(TextFormField), findsNWidgets(3));
      },
    );

    testWidgets(
      'form should have 1 [DropdownButtonFormField<int>] widget and 1 DropdownButtonFormField<ItemType> widget',
      (tester) async {
        // arrange
        await tester.pumpWidget(form);

        // assert
        expect(find.byType(DropdownButtonFormField<int>), findsOneWidget);
        expect(find.byType(DropdownButtonFormField<ItemType>), findsOneWidget);
      },
    );

    testWidgets(
      'form should have 1 [DropdownButtonFormField<int>] widget and 1 DropdownButtonFormField<ItemType> widget',
      (tester) async {
        // arrange
        await tester.pumpWidget(form);

        // assert
        expect(find.byType(DropdownButtonFormField<int>), findsOneWidget);
        expect(find.byType(DropdownButtonFormField<ItemType>), findsOneWidget);
      },
    );

    testWidgets(
      'form should have 1 [ElevatedButton] widget',
      (tester) async {
        // arrange
        await tester.pumpWidget(form);

        // assert
        expect(find.byType(ElevatedButton), findsOneWidget);
      },
    );
  });

  group('[INITIAL STATE]', () {
    testWidgets(
      'value of name field should match [tInventoryItem.name] field',
      (tester) async {
        // arrange
        await tester.pumpWidget(form);
        // act
        final TextFormField nameField = tester.widget(
          find.byKey(const ValueKey('name')),
        );

        // assert
        expect(nameField.initialValue, tInventoryItem.name);
      },
    );

    testWidgets(
      'value of height and width fields should match [tInventoryItem.dimesion]\'s height and width field',
      (tester) async {
        // arrange
        await tester.pumpWidget(form);
        // act
        final TextFormField dimHeightField = tester.widget(
          find.byKey(const ValueKey('height')),
        );

        final TextFormField dimWidthField = tester.widget(
          find.byKey(const ValueKey('width')),
        );

        // assert
        expect(
          int.tryParse(dimHeightField.initialValue!),
          tInventoryItem.dimension.height,
        );
        expect(
          int.tryParse(dimWidthField.initialValue!),
          tInventoryItem.dimension.width,
        );
      },
    );

    testWidgets(
      'value of quantity dropdown should match [tInventoryItem.quantity]',
      (tester) async {
        // arrange
        await tester.pumpWidget(form);
        // act
        final DropdownButtonFormField<int> qtyField = tester.widget(
          find.byType(DropdownButtonFormField<int>),
        );
        // assert
        expect(
          qtyField.initialValue,
          tInventoryItem.quantity,
        );
      },
    );

    testWidgets(
      'value of ItemType dropdown should match [tInventoryItem.itemType]',
      (tester) async {
        // arrange
        await tester.pumpWidget(form);
        // act
        final DropdownButtonFormField<ItemType> typeField = tester.widget(
          find.byType(DropdownButtonFormField<ItemType>),
        );
        // assert
        expect(
          typeField.initialValue,
          tInventoryItem.itemType,
        );
      },
    );
  });

  group('VALIDATION', () {
    testWidgets(
      'if name field is empty and Save button is tapped, The name field should highlight [nameValidationMessage]',
      (tester) async {
        await tester.pumpWidget(form);
        final nameFieldFinder = find.byKey(const ValueKey('name'));
        final TextFormField nameField = tester.widget(nameFieldFinder);
        // Clearing the name field (if not empty)
        if (nameField.initialValue!.isNotEmpty) {
          await tester.enterText(nameFieldFinder, '');
        }
        // Read new frame
        await tester.pump();
        // Confirmed that name field is currently empty
        expect(nameField.controller?.text, '');
        // Try tapping the save button now
        await tester.tap(find.byType(ElevatedButton));
        // Wait for the validation message to appear
        await tester.pumpAndSettle();
        // See if any widget is there on form who has [nameValidationMessage]
        expect(find.text(nameValidationMessage), findsOneWidget);
      },
    );

    testWidgets(
      'if height field is empty and width has some value and Save button is tapped, The height field should highlight [dimesionValidationMessage]',
      (tester) async {
        await tester.pumpWidget(form);
        final heightFieldFinder = find.byKey(const ValueKey('height'));
        final widthFieldFinder = find.byKey(const ValueKey('width'));
        final TextFormField heightField = tester.widget(heightFieldFinder);
        final TextFormField widthField = tester.widget(widthFieldFinder);

        // Confirmed that height field is currently matches [tInventoryItem.dimension.height]
        expect(
          int.tryParse(heightField.initialValue!),
          tInventoryItem.dimension.height,
        );
        // Removing the initial value to make the height field empty
        await tester.enterText(heightFieldFinder, '');
        // reading new frame
        await tester.pump();
        // Checking if height field has no value now
        expect(heightField.controller?.text, '');
        // Check if width field is not empty
        expect(widthField.controller?.text.isNotEmpty, true);
        // Try tapping the save button now
        await tester.tap(find.byType(ElevatedButton));
        // Wait for the validation message to appear
        await tester.pumpAndSettle();
        // See if any widget is there on form who has [nameValidationMessage]
        expect(find.text(dimesionValidationMessage), findsOneWidget);
      },
    );

    testWidgets(
      'if width field is empty and height has some value and Save button is tapped, The width field should highlight [dimesionValidationMessage]',
      (tester) async {
        await tester.pumpWidget(form);
        final heightFieldFinder = find.byKey(const ValueKey('height'));
        final widthFieldFinder = find.byKey(const ValueKey('width'));
        final TextFormField heightField = tester.widget(heightFieldFinder);
        final TextFormField widthField = tester.widget(widthFieldFinder);

        // Confirmed that width field is currently matches [tInventoryItem.dimension.height]
        expect(
          int.tryParse(widthField.initialValue!),
          tInventoryItem.dimension.width,
        );
        // Removing the initial value to make the width field empty
        await tester.enterText(widthFieldFinder, '');
        // reading new frame
        await tester.pump();
        // Checking if width field has no value now
        expect(widthField.controller?.text, '');
        // Check if height field is not empty
        expect(heightField.controller?.text.isNotEmpty, true);
        // Try tapping the save button now
        await tester.tap(find.byType(ElevatedButton));
        // Wait for the validation message to appear
        await tester.pumpAndSettle();
        // See if any widget is there on form who has [nameValidationMessage]
        expect(find.text(dimesionValidationMessage), findsOneWidget);
      },
    );

    testWidgets(
      'if both height and width fields are empty and Save button is tapped, both the fields should highlight [dimesionValidationMessage]',
      (tester) async {
        await tester.pumpWidget(form);
        final heightFieldFinder = find.byKey(const ValueKey('height'));
        final widthFieldFinder = find.byKey(const ValueKey('width'));
        final TextFormField heightField = tester.widget(heightFieldFinder);
        final TextFormField widthField = tester.widget(widthFieldFinder);

        // Confirmed that both fields matche [tInventoryItem.dimension.height] & [tInventoryItem.dimension.width] resp.
        expect(
          int.tryParse(heightField.initialValue!),
          tInventoryItem.dimension.height,
        );
        expect(
          int.tryParse(widthField.initialValue!),
          tInventoryItem.dimension.width,
        );
        // Removing the initial values
        await tester.enterText(heightFieldFinder, '');
        await tester.enterText(widthFieldFinder, '');
        // reading new frame
        await tester.pump();
        // Checking if values are empty now
        expect(heightField.controller?.text, '');
        expect(widthField.controller?.text, '');
        // Try tapping the save button now
        await tester.tap(find.byType(ElevatedButton));
        // Wait for the validation message to appear
        await tester.pumpAndSettle();
        // See if any widget is there on form who has [nameValidationMessage]
        expect(find.text(dimesionValidationMessage), findsNWidgets(2));
      },
    );
  });
}
