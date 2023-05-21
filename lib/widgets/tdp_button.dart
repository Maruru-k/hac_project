import 'package:flutter/material.dart';
import 'package:hac_project/theme/tdp_colors.dart';

class TdpButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final double height;
  final double borderRadius;

  const TdpButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.height = 54,
    this.borderRadius = 54
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(TdpColors.blue),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          )),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
