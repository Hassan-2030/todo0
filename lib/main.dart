import 'package:flutter/material.dart';
import 'package:todo0/styles/my_them.dart';

import 'layout/home_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLayout.routName,
      routes: {
        HomeLayout.routName: (context) => HomeLayout(),
      },
      debugShowCheckedModeBanner: false,
      theme: My_ThemData.lightThem,
      darkTheme: My_ThemData.darkThem,
      themeMode: ThemeMode.light,
    );
  }
}
