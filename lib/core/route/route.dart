import 'package:flutter/material.dart';
import 'package:technical_test_okta/features/detail/presentation/pages/detail_page.dart';
import 'package:technical_test_okta/features/favorite/presentation/page/favorite_page.dart';
import 'package:technical_test_okta/features/home/presentation/pages/home_page.dart';
import 'package:technical_test_okta/features/search/presentation/search_page.dart';

import '../presentation/pages/dashboard_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardPage.routeName:
      return MaterialPageRoute(builder: (_) => const DashboardPage());
    case HomePage.routeName:
      return MaterialPageRoute(builder: (_) => const HomePage());
    case SearchPage.routeName:
      final args = settings.arguments as SearchPageArgumnets;
      return MaterialPageRoute(
          builder: (_) => SearchPage(
                textSearch: args.textSearch,
              ));
    case DetailPage.routeName:
      final args = settings.arguments as int;
      return MaterialPageRoute(
          builder: (_) => DetailPage(
                id: args,
              ));
    case FavoriteMoviePage.routeName:
      return MaterialPageRoute(builder: (_) => const FavoriteMoviePage());
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
