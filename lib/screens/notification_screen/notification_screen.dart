import 'package:flutter/material.dart';
import 'package:hac_project/constants.dart';
import 'package:hac_project/screens/notification_screen/widgets/notification_card.dart';
import 'package:hac_project/screens/notification_screen/widgets/prompt_card.dart';
import 'package:hac_project/theme/tdp_colors.dart';
import 'package:hac_project/theme/tdp_text_styles.dart';
import 'package:hac_project/widgets/amount_bunner.dart';
import 'package:hac_project/models/notification_info.dart';

class NotificationScreen extends StatelessWidget {
  final ScrollController controller = ScrollController();

  NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TdpColors.lightBlue,
      body: SafeArea(
        child: CustomScrollView(
          // controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 18),
                child: SizedBox(
                  height: 128,
                  child: ListView.separated(
                    itemCount: 10,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => PromptCard(
                      title: 'Data',
                      color: colors[index % colors.length].withAlpha(180),
                      onTap: () {},
                    ),
                    separatorBuilder: (context, index) => Container(width: 12),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 28,
                  top: 18,
                ),
                color: TdpColors.lightBlue,
                child: const AmountBanner(),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  color: TdpColors.wight,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: ListView.separated(
                  controller: controller,
                  shrinkWrap: true,
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == 0)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              "Уведомления",
                              style: TdpTextStyle.standard(TdpColors.black),
                            ),
                          ),
                        NotificationCard(
                          notification: NotificationInfo(
                            id: 2,
                            title: "title",
                            description: "description",
                            amount: 123,
                            sad: "sad",
                            publishedAt: DateTime.now(),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Container(height: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
