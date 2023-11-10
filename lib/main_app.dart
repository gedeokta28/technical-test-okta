import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_okta/core/presentation/pages/dashboard.dart';
import 'core/route/route.dart' as router;

import 'core/utils/app_settings.dart';
import 'core/utils/injection.dart';
import 'core/utils/themes.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: locator<GlobalKey<NavigatorState>>(),
      title: appName,
      theme: themeData,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      home: const DashboardPage(),
      builder: FlutterSmartDialog.init(),
    );
  }
}
