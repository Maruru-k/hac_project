import 'package:flutter/material.dart';
import 'package:hac_project/screens/message_secreen/write_message_screen.dart';
import 'package:hac_project/theme/tdp_colors.dart';
import 'package:hac_project/theme/tdp_text_styles.dart';
import 'package:hac_project/widgets/tdp_button.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/Illustation.png",
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              const SizedBox(height: 100),
              Text(
                "На данный момент нет обращений",
                style: TdpTextStyle.title3(TdpColors.black),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TdpButton(
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
                        style: TdpTextStyle.standard(TdpColors.white),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_forward_outlined,
                        color: TdpColors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
