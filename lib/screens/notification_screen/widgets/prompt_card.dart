import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hac_project/theme/tdp_colors.dart';
import 'package:hac_project/theme/tdp_text_styles.dart';

class PromptCard extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final String title;
  final VoidCallback? onTap;

  const PromptCard({
    Key? key,
    required this.color,
    required this.title,
    this.height = 128,
    this.width = 140,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Expanded(
              child: SvgPicture.asset("assets/icons/icon.svg"),
            ),
            Expanded(
              child: Text(
                title,
                style: TdpTextStyle.small(TdpColors.white)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
