import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:localads/screens/chat_screen_accueil.dart';
import 'package:localads/screens/detail_screen.dart';
import 'package:localads/screens/profile_screen.dart';
import 'package:localads/screens/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:localads/utilis/constant.dart';

import 'publish_screen.dart';

class Home_sceen extends StatefulWidget {
  @override
  State<Home_sceen> createState() => _Home_sceenState();
}

class _Home_sceenState extends State<Home_sceen> {
  CollectionReference _annonce =
      FirebaseFirestore.instance.collection('annonces');
  late Stream<QuerySnapshot> _streamAnnonce;
  List<QueryDocumentSnapshot> listQueryDocumentSnapshot = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamAnnonce = _annonce.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      // drawer:
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
                        ],
                      ),
                    )
                  ],
                ),
              ),
              StreamBuilder<Object>(
                  stream: _streamAnnonce,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Text("Error ");
                    } else if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      QuerySnapshot querySnapshot = snapshot.data;
                      listQueryDocumentSnapshot.addAll(querySnapshot.docs);
                      List<String> image = [];

                      // for (var item in listQueryDocumentSnapshot) {
                      //   image.add(item['imageUrl']);
                      // }
                    }
                    return Column(
                      children: [
                        for (var item in listQueryDocumentSnapshot)
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    item['imageUrl'].first,
                                  ),
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
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 75,
                                        child: Text(
                                          item['description'],
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
                                                  builder: (context) =>
                                                      Details()));
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color.fromARGB(
                                                255, 90, 120, 250),
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
                      ],
                    );
                  }),
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
      // bottomNavigationBar:
      extendBody: true,
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
