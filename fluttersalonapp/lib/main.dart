//region imports
import 'package:fluttersalonapp/screens/BMSplashScreen.dart';
import 'package:fluttersalonapp/screens/BMWalkThroughScreen.dart';
import 'package:fluttersalonapp/store/AppStore.dart';
import 'package:fluttersalonapp/utils/AppTheme.dart';
import 'package:fluttersalonapp/utils/BMConstants.dart';
import 'package:fluttersalonapp/utils/BMDataGenerator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:get/get.dart';
import 'package:fluttersalonapp/controllers/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';



AppStore appStore = AppStore();

int currentIndex = 0;

Future main() async {
  //region Entry Point
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthService()));
  await initialize(aLocaleLanguageList: languageList());

  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));

  defaultRadius = 10;
  defaultToastGravityGlobal = ToastGravity.BOTTOM;

  runApp(MyApp());
  //endregion
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: '$appName${!isMobile ? ' ${platformName()}' : ''}',
        home: const BMWalkThroughScreen(),
        theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
        navigatorKey: navigatorKey,
        scrollBehavior: SBehavior(),
        supportedLocales: LanguageDataModel.languageLocales(),
        localeResolutionCallback: (locale, supportedLocales) => locale,
      ),
    );
  }
}
