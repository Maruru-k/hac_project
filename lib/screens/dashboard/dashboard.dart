import 'package:hac_project/screens/message_secreen/message_screen.dart';
import 'package:hac_project/widgets/buttom_bar.dart';
import 'package:flutter/material.dart';
import 'package:hac_project/screens/notification_screen/notification_screen.dart';
import 'package:hac_project/screens/profile_screen/profile_screen.dart';
import 'package:hac_project/screens/services_screen/services_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentPageIndex = 0;

  List<Widget> page = [
    NotificationScreen(),
    MessageScreen(),
    ServicesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TdpNavigationBar(
          currentPageIndex: currentPageIndex,
          pages: page,
          onChange: (int value) {
            setState(() {
              currentPageIndex = value;
            });
          },
        ),
      ],
    );
  }
}
