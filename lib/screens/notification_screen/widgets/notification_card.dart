import 'package:flutter/material.dart';
import 'package:hac_project/models/notification_info.dart';
import 'package:hac_project/theme/tdp_colors.dart';
import 'package:hac_project/theme/tdp_text_styles.dart';

class NotificationCard extends StatelessWidget {
  final NotificationInfo notification;

  const NotificationCard({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String type = notification.sad != null
        ? "Обращение"
        : notification.amount != null
            ? "Платежи"
            : "Новости";
    return Container(
      height: 112,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: TdpColors.lightBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$type / ${notification.publishedAt..toString()}",
            style: TdpTextStyle.small(TdpColors.black.withOpacity(0.5)),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                notification.title,
                style: TdpTextStyle.title2(TdpColors.black),
              ),
              Text(
                "- ${notification.amount} ₽",
                style: TdpTextStyle.title2(TdpColors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
