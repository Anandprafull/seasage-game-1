import 'package:firebase_core/firebase_core.dart';
import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:plasticdive/app/app.bottomsheets.dart';
import 'package:plasticdive/app/app.dialogs.dart';
import 'package:plasticdive/app/app.locator.dart';
import 'package:plasticdive/app/app.router.dart';
import 'package:plasticdive/firebase_options.dart';
import 'package:plasticdive/ui/common/app_theme.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Flame
  await Flame.device.fullScreen();

  // Stacked
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  // Flutter web SEO meta tags
  if (kIsWeb) {
    MetaSEO().config();
  }

  // Flutter
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plastic Dive',

      // AppTheme
      theme: appTheme,

      debugShowCheckedModeBanner: false,

      // Routing
      initialRoute: Routes.homeView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
