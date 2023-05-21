import 'package:flutter/material.dart';
import 'package:hac_project/theme/tdp_colors.dart';
import 'package:hac_project/theme/tdp_text_styles.dart';
import 'package:hac_project/widgets/linear_amount_indicator.dart';

class PaymentAmountWidget extends StatelessWidget {
  final List<int> amounts;

  const PaymentAmountWidget({
    Key? key,
    required this.amounts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "24 500 ₽",
          style: TdpTextStyle.large(TdpColors.red),
        ),
        const SizedBox(height: 20),
        LinearAmountIndicator(amounts: amounts)
      ],
    );
  }
}
