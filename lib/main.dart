import 'package:flutter/material.dart';
import 'package:modeler/Screen/cardboy.dart';
import 'package:modeler/home_model/cardboy_Grid.dart';
import 'package:modeler/home_model/home_details.dart';
import 'package:modeler/theme/theme_constants.dart';
import 'package:modeler/theme/theme_manager.dart';
import 'package:modeler/utils/route_pages.dart';
import 'Screen/nav.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: Nav.route(),

      // routes: routes,
      onGenerateRoute: (settings) {
        if (settings.name == Nav.route()) {
          return MaterialPageRoute(
            builder: (context) => Nav(),
          );
        }

        else if (settings.name == Trial.route()) {
          Map<String, dynamic>? result =
              settings.arguments as Map<String, dynamic>?;
          print("my page is  trial ${result!["age"]}");
          return MaterialPageRoute(
            builder: (context) => Trial(),
          );
        }

       else if (settings.name == Push.route()) {
          Map<String, dynamic>? result =
              settings.arguments as Map<String, dynamic>?;
          print("my page is  trial ${result!["cardType"]}");
          return MaterialPageRoute(
            builder: (context) => Push(
              cardType: result!["cardType"],
              homeModelDetail: result!["homeModelDetail"],
            ),
          );
        }
      },
      themeMode: themeManager.themeMode,
      // home:Scaffold(
      //    body:Nav()
      // )
    );
  }
}
