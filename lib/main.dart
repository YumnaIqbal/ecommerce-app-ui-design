import 'package:day3/pages/cart_page.dart';
import 'package:day3/pages/home_page.dart';
import 'package:day3/pages/login_page.dart';
import 'package:day3/pages/splash_page.dart';
import 'package:day3/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'core/store.dart';

void main() {
  runApp(
    VxState(
      store: MyStore(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Catalog App of Flutter',
        themeMode: ThemeMode.system,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        initialRoute: '/', //bydefualt
        routes: {
          '/': (context) => SplashScreen(),
          '/home': (context) => HomePage(),
          '/login': (context) => Loginpage(),
          '/cart': (context) => CartPage(),
        });
  }

}
