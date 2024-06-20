
import 'package:filroll/pages/screens/Home/homescreen.dart';
import 'package:filroll/pages/screens/Saved/saved.dart';
import 'package:filroll/pages/screens/search/search.dart';
//import 'package:filroll/services/unsplash_service.dart';
import 'package:flutter/material.dart';
//import 'package:filroll/models/photo.dart';
//import 'Favorite/favorite.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
 //final Photo photo;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
 // late Future<List<Photo>> _futurePhotos;

  int cuttentIndex = 0;
  List screens =  [
    
    const Homescreen(),
    const Search(),
    const Homescreen(),
    SavedPhotosScreen(),
     const Search(),
    // const Homescreen(),
  ];
 

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            cuttentIndex = 2;
          });
        },
        shape: const CircleBorder(),
       
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 167, 3, 237),
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Color.fromARGB(255, 209, 202, 202),
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  cuttentIndex = 0;
                });
              },
              icon: Icon(
                
                Icons.home,
                size: 30,
                color: cuttentIndex == 0 ? Color.fromARGB(255, 195, 6, 242) : const Color.fromARGB(255, 10, 10, 10),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  cuttentIndex = 1;
                });
              },
              icon: Icon(
                Icons.search,
                size: 30,
                color: cuttentIndex == 1 ? Color.fromARGB(255, 195, 6, 242): Color.fromARGB(255, 10, 10, 10),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  cuttentIndex = 3;
                });
              },
              icon: Icon(
                Icons.save,
                size: 30,
                color: cuttentIndex == 3 ? Color.fromARGB(255, 195, 6, 242) : Color.fromARGB(255, 10, 10, 10),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  cuttentIndex = 4;
                });
              },
              icon: Icon(
                Icons.person,
                size: 30,
                color: cuttentIndex == 4 ? Color.fromARGB(255, 195, 6, 242) : Color.fromARGB(255, 10, 10, 10),
              ),
            ),
          ],
        ),
      ),
      body: screens[cuttentIndex],
    );
  }
}

