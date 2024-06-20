//import 'package:filroll/Provider/saved_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:filroll/routes/router.dart";
//import 'package:provider/provider.dart';

//import "package:provider/provider.dart";
//import "package:filroll/pages/home.dart";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Travel Tourist",
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      initialRoute: '/home',
      getPages: appRoutes(),
    );
  }
}
