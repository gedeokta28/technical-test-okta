import 'package:flutter/material.dart';
import 'core/utils/helper.dart';
import 'core/utils/injection.dart';
import 'main_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await locatorInit();
    runApp(const MainApp());
  } catch (e) {
    logMe(e);
  }
}
