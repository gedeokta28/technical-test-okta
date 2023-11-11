import 'package:flutter/material.dart';
import 'package:technical_test_okta/features/home/presentation/pages/home_page.dart';

import '../presentation/pages/dashboard_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardPage.routeName:
      return MaterialPageRoute(builder: (_) => const DashboardPage());
    case HomePage.routeName:
      return MaterialPageRoute(builder: (_) => const HomePage());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
