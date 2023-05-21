import 'package:flutter/material.dart';
import 'package:hac_project/theme/tdp_colors.dart';
import 'package:hac_project/theme/tdp_text_styles.dart';

class ProfileMenuWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;

  const ProfileMenuWidget({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 34,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text ?? "",
              style: TdpTextStyle.standard(TdpColors.black),
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
