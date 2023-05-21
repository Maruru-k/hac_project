import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hac_project/models/user.dart';
import 'package:hac_project/screens/profile_screen/profile_menu_item.dart';
import 'package:hac_project/theme/tdp_colors.dart';
import 'package:hac_project/theme/tdp_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  double get avatarSize => 98;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TdpColors.lightBlue,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 52),
            ClipOval(
              child: user.avatar != null
                  ? CachedNetworkImage(
                      imageUrl: user.avatar!,
                      height: avatarSize,
                      width: avatarSize,
                    )
                  : Container(
                      foregroundDecoration: BoxDecoration(
                        border: Border.all(color: TdpColors.blue, width: 3),
                        borderRadius: BorderRadius.circular(avatarSize),
                      ),
                      child: Image.asset(
                        "assets/profile_avatar.png",
                        height: avatarSize,
                        width: avatarSize,
                        // color: TdpColors.grey,
                      ),
                    ),
            ),
            const SizedBox(height: 8),
            Text(
              user.name,
              style: TdpTextStyle.title2(TdpColors.black),
            ),
            const SizedBox(height: 18),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              decoration: BoxDecoration(
                color: TdpColors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  ProfileMenuWidget(
                    text: user.phoneNumber,
                    onTap: () {},
                  ),
                  const Divider(height: 16),
                  ProfileMenuWidget(
                    text: user.email,
                    onTap: () {},
                  ),
                  const Divider(height: 16),
                  ProfileMenuWidget(
                    text: "О управляющей компании",
                    onTap: () {},
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            "Выйти",
                            style: TdpTextStyle.standard(TdpColors.red),
                          ),
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.exit_to_app_outlined,
                            color: TdpColors.red,
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
