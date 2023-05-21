import 'package:flutter/material.dart';
import 'package:hac_project/theme/tdp_colors.dart';
import 'package:hac_project/theme/tdp_text_field.dart';
import 'package:hac_project/theme/tdp_text_styles.dart';
import 'package:hac_project/widgets/tdp_button.dart';

class WriteMessageScreen extends StatelessWidget {
  const WriteMessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(
          top: 30,
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Новое обращение",
              style: TdpTextStyle.title4(TdpColors.black),
            ),
            const SizedBox(height: 32),
            Text(
              "Тема",
              style: TdpTextStyle.standard(TdpColors.black),
            ),
            const SizedBox(height: 16),
            TdpTextField(),
            const SizedBox(height: 20),
            Text(
              "Комментарий",
              style: TdpTextStyle.standard(TdpColors.black),
            ),
            const SizedBox(height: 16),
            TdpTextField(
              linesCount: 10,
            ),
            const SizedBox(height: 20),
            Text(
              "Фото",
              style: TdpTextStyle.standard(TdpColors.black),
            ),
            const SizedBox(height: 16),
            TdpButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WriteMessageScreen(),
                    ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Написать  обращение",
                    style: TdpTextStyle.standard(TdpColors.wight),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward_outlined,
                    color: TdpColors.wight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
