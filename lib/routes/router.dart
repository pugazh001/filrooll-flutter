
import "package:filroll/pages/home.dart";
import "package:filroll/pages/landingPage.dart";
//import "package:flutter/material.dart";
import "package:get/get.dart";

appRoutes() => [
  GetPage(name: '/home', page: ()=>const HomePage()),
  GetPage(name: '/landpage', page: ()=>const BottomNavBar())
];
