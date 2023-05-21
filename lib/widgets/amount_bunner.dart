import 'package:flutter/material.dart';
import 'package:hac_project/theme/tdp_colors.dart';
import 'package:hac_project/theme/tdp_text_styles.dart';
import 'package:hac_project/widgets/tdp_button.dart';

class AmountBanner extends StatelessWidget {
  const AmountBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
      decoration: BoxDecoration(
        color: TdpColors.wight,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Долг составляет",
            style: TdpTextStyle.title1(TdpColors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "24 500 ₽",
                style: TdpTextStyle.large(TdpColors.red),
              ),
              const SizedBox(width: 36),
              Flexible(
                child: TdpButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Оплатить",
                        style: TdpTextStyle.small(TdpColors.wight),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_forward_outlined,
                        color: TdpColors.wight,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
