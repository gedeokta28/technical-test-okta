import 'package:flutter/material.dart';

import '../presentation/pages/dashboard.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardPage.routeName:
      return MaterialPageRoute(builder: (_) => const DashboardPage());
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
