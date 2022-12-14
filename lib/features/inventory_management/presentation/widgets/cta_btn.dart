import 'package:flutter/material.dart';
import 'package:happylocate_app/core/app/color_pallete.dart';
import 'package:happylocate_app/core/app/typography.dart';

class CTAButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CTAButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: textColor,
      child: Container(
        height: 58,
        width: 164,
        padding: const EdgeInsets.all(19),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            label,
            style: ctaBtnTypo,
          ),
        ),
      ),
    );
  }
}
