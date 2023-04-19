import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:localads/screens/chat_screen_accueil.dart';
import 'package:localads/screens/detail_screen.dart';
import 'package:localads/screens/profile_screen.dart';
import 'package:localads/screens/search_screen.dart';
import 'package:flutter/cupertino.dart';

class Home_sceen extends StatefulWidget {
  @override
  State<Home_sceen> createState() => _Home_sceenState();
}

class _Home_sceenState extends State<Home_sceen> {
  int SelectPages = 0;
  final _pageNo = [Home_sceen(), Chat_screen(), Profile(), search()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_city),
            Text("Home"),
          ],
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(right: 25),
              child: const Icon(
                Icons.share,
                // color: Colors.black,
                size: 25,
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 90, 120, 250),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.5),
                      bottomRight: Radius.circular(25.5))),
            ),
            Expanded(child: Column()),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 90, 120, 250),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.5),
                      topRight: Radius.circular(25.5))),
            )
          ],
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.search,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: Form(
                        child: TextFormField(
                          decoration: InputDecoration(
                              iconColor: Colors.white,
                              hintText: "type your research here..."),
                        ),
                      ),
                    )
                  ],
                ),
                height: 45,
                width: MediaQuery.of(context).size.width / 1.1,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color.fromARGB(255, 221, 219, 219),
                ),
              ),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width / 1.1,
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "For you",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text("See all"),
                          Icon(
                            Icons.arrow_circle_right,
                            color: Color.fromARGB(255, 90, 120, 250),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                // height: 200,
                // width: MediaQuery.of(context).size.width / 1.1,
                margin: EdgeInsets.only(bottom: 10),
                // padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // deux contenair row
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          blocIcon(
                            'mobile',
                            Icons.home,
                            Color.fromARGB(255, 90, 72, 255),
                          ),
                          blocIcon(
                            'car',
                            Icons.car_crash,
                            Colors.orange,
                          ),
                          blocIcon(
                            'furniture',
                            Icons.toll_outlined,
                            Colors.red,
                          ),
                          blocIcon(
                            'mobile',
                            Icons.home,
                            Color.fromARGB(255, 7, 255, 193),
                          ),
                          //   Container(
                          //     child: Column(
                          //       children: [
                          //         Container(
                          //           child: Icon(
                          //             Icons.car_crash,
                          //             color: Colors.white,
                          //           ),
                          //           height: 70,
                          //           width: 70,
                          //           decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(10),
                          //               color: Color.fromARGB(255, 231, 179, 5)),
                          //         ),
                          //         Container(
                          //           child: Text("Cars"),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          //   Container(
                          //     child: Column(
                          //       children: [
                          //         Container(
                          //           child: Icon(
                          //             Icons.home,
                          //             color: Colors.white,
                          //           ),
                          //           height: 70,
                          //           width: 70,
                          //           decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(10),
                          //               color: Color.fromARGB(255, 65, 54, 218)),
                          //         ),
                          //         Container(
                          //           child: Text("furniture"),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          //   Container(
                          //     child: Column(
                          //       children: [
                          //         Container(
                          //           child: Icon(
                          //             Icons.bike_scooter,
                          //             color: Colors.white,
                          //           ),
                          //           height: 70,
                          //           width: 70,
                          //           decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(10),
                          //               color: Color.fromARGB(255, 22, 201, 192)),
                          //         ),
                          //         Container(
                          //           child: Text("bike"),
                          //         )
                          //       ],
                          //     ),
                          //   )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          blocIcon('fashion', Icons.pan_tool, Colors.green),
                          blocIcon('jobs', Icons.work,
                              Color.fromARGB(255, 236, 89, 79)),
                          blocIcon(
                              'properties', Icons.flutter_dash, Colors.amber),
                          blocIcon('more', Icons.more,
                              Color.fromARGB(255, 7, 238, 255)),

                          //   Container(
                          //     child: Column(
                          //       children: [
                          //         Container(
                          //           child: Icon(
                          //             Icons.mode,
                          //             color: Colors.white,
                          //           ),
                          //           height: 70,
                          //           width: 70,
                          //           decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(10),
                          //               color: Color.fromARGB(255, 88, 228, 7)),
                          //         ),
                          //         Container(
                          //           child: Text("Fashion"),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          //   Container(
                          //     child: Column(
                          //       children: [
                          //         Container(
                          //           child: Icon(
                          //             Icons.work,
                          //             color: Colors.white,
                          //           ),
                          //           height: 70,
                          //           width: 70,
                          //           decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(10),
                          //               color: Color.fromARGB(255, 243, 5, 203)),
                          //         ),
                          //         Container(
                          //           child: Text("jobs"),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          //   Container(
                          //     child: Column(
                          //       children: [
                          //         Container(
                          //           child: Icon(
                          //             Icons.gif,
                          //             color: Colors.white,
                          //           ),
                          //           height: 70,
                          //           width: 70,
                          //           decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(10),
                          //               color: Color.fromARGB(255, 76, 79, 240)),
                          //         ),
                          //         Container(
                          //           child: Text("propertie"),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          //   Container(
                          //     child: Column(
                          //       children: [
                          //         Container(
                          //           child: Icon(
                          //             Icons.more,
                          //             color: Colors.white,
                          //           ),
                          //           height: 70,
                          //           width: 70,
                          //           decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(10),
                          //               color: Color.fromARGB(255, 118, 206, 3)),
                          //         ),
                          //         Container(
                          //           child: Text("more"),
                          //         )
                          //       ],
                          //     ),
                          //   )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 6),
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/montre1.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 150,
                      width: 125,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 75,
                            child: Text(
                              "Montre Nouvelle game, juste pour les connaisseurs",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Details()));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              child: Text(
                                "Explore now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 90, 120, 250),
                              ),
                            ),
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width / 1.1,
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Fresh Recommendation",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "See all",
                          ),
                          Icon(
                            Icons.arrow_circle_right,
                            color: Color.fromARGB(255, 90, 120, 250),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Samethings("bijoux"),
              Samethings("montre"),
              Samethings("Drone"),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Color.fromARGB(255, 90, 120, 250),
      ),
      //   bottomNavigationBar: Container(
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       boxShadow: [
      //         BoxShadow(),
      //       ],
      //     ),
      //     height: 55,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         Icon(
      //           Icons.home,
      //         ),
      //         InkWell(
      //           onTap: () {
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => Chat_screen()));
      //           },
      //           child: Icon(
      //             Icons.chat_rounded,
      //           ),
      //         ),
      //         Container(
      //           height: 35,
      //           width: 35,
      //         ),
      //         // Icon(
      //         //   Icons.add,
      //         // ),
      //         Icon(
      //           Icons.heart_broken_rounded,
      //         ),
      //         Icon(
      //           Icons.person,
      //         )
      //       ],
      //     ),
      //   ),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Home_sceen'),
          TabItem(icon: Icons.favorite, title: 'Chat_screen'),
          TabItem(icon: Icons.add, title: 'Profile'),
          TabItem(icon: Icons.person, title: 'search'),
        ],
        initialActiveIndex: SelectPages,
        onTap: (int index) {
          setState(() {
            SelectPages = index;
          });
        },
      ),
    );
  }

  Container Samethings(Title) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            child: Text(
              Title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            alignment: Alignment.bottomLeft,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Picture('assets/img/bijoux1.jpg'),
                  Picture('assets/img/bijoux2.jpg'),
                  Picture('assets/img/bijoux3.jpg'),
                  Picture('assets/img/bijoux4.jpg'),
                  Picture('assets/img/bijoux5.jpg'),
                  Picture('assets/img/bijoux6.jpg'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container Picture(PicturesIm) {
    return Container(
      height: 150,
      width: 150,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image:
            DecorationImage(image: AssetImage(PicturesIm), fit: BoxFit.cover),
      ),
    );
  }

//
  Widget blocIcon(title, icon, color) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Icon(
              icon,
              color: Colors.white,
            ),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
          ),
          Container(
            child: Text(
              title,
            ),
          )
        ],
      ),
    );
  }
}
