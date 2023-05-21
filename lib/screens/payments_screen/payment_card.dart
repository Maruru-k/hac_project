import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hac_project/theme/tdp_colors.dart';
import 'package:hac_project/theme/tdp_text_styles.dart';

class PaymentCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final int amount;

  const PaymentCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(icon),
      title: Text(
        title,
        style: TdpTextStyle.standard(TdpColors.black),
      ),
      subtitle: Text(
        subtitle,
        style: TdpTextStyle.standard(TdpColors.black),
      ),
      trailing: Text(
        "- $amount ₽",
        style: TdpTextStyle.title2(TdpColors.black),
      ),
    );
  }
}
