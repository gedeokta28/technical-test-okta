import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_okta/core/presentation/provider/dashboard_provider.dart';
import 'package:technical_test_okta/core/presentation/widgets/card_dashboard.dart';
import 'package:technical_test_okta/core/presentation/widgets/custom_app_bar.dart';
import 'package:technical_test_okta/core/static/colors.dart';
import 'package:technical_test_okta/core/utils/injection.dart';
import 'package:technical_test_okta/features/home/presentation/pages/home_page.dart';

import '../../utils/app_settings.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = '/dashboard';

  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _provider = locator<DashboardProvider>();
  @override
  void initState() {
    _provider.fetchDataPopularMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _provider,
        builder: (context, child) => Scaffold(
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
                    onPress: () {
                      Navigator.pushNamed(context, HomePage.routeName);
                    },
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
            )));
  }
}
