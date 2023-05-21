import 'package:flutter/material.dart';
import 'package:hac_project/theme/tdp_colors.dart';

class TdpTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
final int linesCount;
  const TdpTextField({
    Key? key,
    this.controller,
    this.linesCount = 1,
    this.hintText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: linesCount,
      maxLines: linesCount,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: TdpColors.lines),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: TdpColors.lines),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
