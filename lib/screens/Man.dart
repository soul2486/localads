import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:localads/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import '../utilis/constant.dart';
import '../widgets/custom_button.dart';
import 'Accueil_screen.dart';
import 'chat_screen_accueil.dart';
import 'profile_screen.dart';
import 'publish_screen.dart';
import 'search_screen.dart';

class MyWidget extends StatefulWidget {
  MyWidget({Key? key}) : super(key: key);
  final _auth = FirebaseAuth.instance;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int SelectPages = 0;
  final _pageNo = [
    Home_sceen(),
    Chat_screen(),
    AddAds(),
    profil(),
    SearchScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   child: ListView.builder(
            //     itemBuilder: ((context, index) {
            //       print(annonce[index].titre);
            //       return Container();
            //     }),
            //     itemCount: annonce.length,
            //   ),
            // ),
            CircleAvatar(
              backgroundColor: secondaryColor,
              backgroundImage: NetworkImage(
                ap.userModel.profilePic,
              ),
              radius: 70,
            ),
            SizedBox(
              height: 20,
            ),
            Text(ap.userModel.name),
            Text(ap.userModel.email),
            Text(ap.userModel.entreprise),
            Text(ap.userModel.phoneNumber),
            Text(ap.userModel.createdAd),
            Text(ap.userModel.uid),
            SizedBox(
              height: 30,
            ),
            customButton(
                onclick: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddAds(),
                          fullscreenDialog: true),
                    ),
                elementChild: Text("Ajouter")),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(bottom: 5),
        child: ConvexAppBar(
          backgroundColor: secondaryColor,
          // top: 100,
          curve: Curves.easeIn, top: -15,
          elevation: 50,
          height: 60, curveSize: 70, style: TabStyle.flip,
          // chipBuilder: ,
          shadowColor: Colors.black12,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(
              icon: Icons.favorite,

              title: 'Chat',
              // activeIcon: ds,
            ),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.person, title: 'Account'),
            TabItem(icon: Icons.person, title: 'Profile'),
          ],
          initialActiveIndex: SelectPages,
          onTap: (int index) {
            setState(() {
              SelectPages = index;
            });
          },
        ),
      ),
      body: _pageNo[SelectPages],
    );
  }
}
