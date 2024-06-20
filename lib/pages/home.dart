import "package:flutter/material.dart";
import "package:get/get.dart";
//import "package:icecreamshop/about.dart";
///import "package:icecreamshop/main.dart";
//import "package:filroll/main.dart";
//import "package:filroll/pages/landingPage.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1000,
        width: double.infinity,
        // color: Colors.red,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
            "https://orig00.deviantart.net/89ce/f/2012/114/5/8/evil_tower_by_alphatroon-d4xfupw.jpg",
          ),
          fit: BoxFit.cover,
        )),
        child:
         Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize:const Size(100, 50),
                      elevation: 10,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Get.toNamed('/landpage');
                  },
                  child: const Text(
                    "Let's Explore...",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
            )
          ],
        ),
      ),
     
    );
  }
}
