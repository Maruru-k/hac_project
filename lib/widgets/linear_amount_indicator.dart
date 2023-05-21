import 'package:flutter/material.dart';
import 'package:hac_project/constants.dart';

class LinearAmountIndicator extends StatelessWidget {
  final List<int> amounts;
  final double height;

  const LinearAmountIndicator({
    Key? key,
    required this.amounts,
    this.height = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(height),
        child: Row(
          children: List<Widget>.generate(
            amounts.length,
            (index) => Flexible(
              flex: amounts[index],
              child: Container(
                color: colors[index % colors.length],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
