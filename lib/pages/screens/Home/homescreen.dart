//import "package:filroll/data/story.dart";
import "package:filroll/models/story.dart";
import "package:filroll/pages/screens/Home/Widget/photo_card.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
//import "package:filroll/models/photo.dart";
//import "package:filroll/models/photo.dart";
//import "package:get/get.dart";
import "package:filroll/services/unsplash_service.dart";

class Homescreen extends StatefulWidget {
  //final Photo photo;
  
  const Homescreen({super.key});
  // final Photo photo;

  // const PhotoCard({required this.photo});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final UnsplashService _unsplashService = UnsplashService();
  Future<List<dynamic>>? _photos;

  @override
  void initState() {
    super.initState();
    _photos = _unsplashService.fetchPhotos();
  }

  final List<String> categories = [
    "Popular",
    "Following",
    "News",
    "Beach",
    "Hiking",
    "Nature",
    "Adventure",
  ];
  //int card=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 17, right: 17),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    // For profile imagge
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://i2.cinestaan.com/image-bank/1500-1500/100001-101000/100006.jpg"),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(20)),
                    ),
// for name email , date of birth and address
                    const Padding(
                      padding: const EdgeInsets.only(top: 25, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Morning",
                            style:
                                TextStyle(height: 0.7, color: Color.fromARGB(115, 230, 6, 250),fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            "Nani..👋",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 100),
                      child: Container(
                        child: IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(15),
                          ),
                          onPressed: () {},
                          iconSize: 30,
                          icon: const Icon(Icons.notifications_active),
                         // color: Color.fromARGB(31, 8, 8, 8),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 02,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 17, right: 17),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: allstatus.length,
                  itemBuilder: (context, index) {
                    final story = allstatus[index];
                    return Container(
                      width: 130.0,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: NetworkImage(story.status),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(story.profile),
                            radius: 30,
                          ),

                          /*  if(index==0)?
                  IconButton(onPressed: () {
                    
                  }, icon:Icon(Icons.add)),:null;*/
                          SizedBox(height: 8),
                          Text(
                            story.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Chip(
                      label: Text(
                        category,
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      backgroundColor: Color.fromARGB(255, 0, 5, 10),
                    ),
                  );
                }).toList(),
              ),
            ),
            // grid
            const SizedBox(
              height: 01,
            ),
           

            Padding(
              padding: const EdgeInsets.all(10.0),
              
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                 // margin: EdgeInsets.only(bottom: 14),
                  
                  height: 400.0,
                  child: FutureBuilder<List<dynamic>>(
                      future: _photos,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          final photos = snapshot.data!;
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: photos.length,
                              itemBuilder: (context, index) {
                                //final cards = card[index];
                                final photo = photos[index];
                                return GestureDetector(
                                  onTap: () {
                                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotoDetailScreen(photo: photo),
                      ),
                    );
                                  },
                                  // margin: EdgeInsets.all(10),
                                  child: Stack(
                                    children: [
                                      // Background Image
                                      Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(photo['urls']['thumb']),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        height: 250,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // User Profile Image and Name
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundImage:
                                                        NetworkImage(photo['urls']['thumb']),
                                                  ),
                                                  SizedBox(width: 8),
                                                  Text(
                                                    photo['user']['name'],
                                                    style: TextStyle(
                                                      color: const Color.fromARGB(255, 11, 11, 11),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            // Headline
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                photo['alt_description'] ,
                                                style: TextStyle(
                                                  color: Color.fromARGB(255, 14, 13, 13),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              
                                            ),
                                            // Bottom Icons (Like, Comment, Share)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.thumb_up,
                                                          color: Colors.white),
                                                      SizedBox(width: 8),
                                                      Icon(Icons.comment,
                                                          color: Colors.white),
                                                    ],
                                                  ),
                                                  Icon(Icons.share,
                                                      color: Colors.white),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Save Icon
                                     /*
                                      Positioned(
                                        right: 10,
                                        top: 10,
                                        child: IconButton(
                                          icon: Icon(Icons.bookmark_border,
                                              color: Colors.white),
                                          onPressed: () {
                                            // Save the photo locally
                                          },
                                        ),
                                      ), */
                                    ],
                                  ),
                                );
                              });
                        }
                      })),
            ),

/*
      
                ],
              ),
            ) */
          ],
        ),
      ),
    );
  }
}
