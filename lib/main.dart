import 'package:flutter/material.dart';
import 'package:shoplan/detailsPage/datails_page.dart';
import 'package:shoplan/homePage/home_page.dart';
import 'package:shoplan/spalshscreen/widgets/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: SplashScreen(),
    );
  }
}
