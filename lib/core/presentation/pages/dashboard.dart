import 'package:flutter/material.dart';
import 'package:technical_test_okta/core/presentation/widgets/card_dashboard.dart';
import 'package:technical_test_okta/core/presentation/widgets/custom_app_bar.dart';
import 'package:technical_test_okta/core/static/colors.dart';

import '../../utils/app_settings.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = '/dashboard';

  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          isLeadingEnable: false,
          backgroundColor: primaryColor,
          centerTitle: false,
          title: appName,
          titleColor: whiteColor,
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(25),
          crossAxisCount: 2,
          children: <Widget>[
            CardDashboard(
                onPress: () {},
                cardIcon: const Icon(
                  Icons.home,
                  size: 70,
                  color: primaryColor,
                ),
                cardTitle: 'Home'),
            CardDashboard(
                onPress: () {},
                cardIcon: const Icon(
                  Icons.favorite,
                  size: 70,
                  color: primaryColor,
                ),
                cardTitle: 'Favorite')
          ],
        ));
  }
}
