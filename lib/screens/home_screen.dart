import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:localads/provider/auth_provider.dart';
import 'package:localads/screens/publish_screen.dart';
import 'package:localads/screens/splash_screen.dart';
import 'package:localads/utilis/constant.dart';
import 'package:localads/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _auth = FirebaseAuth.instance;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    ap.userSignOut().then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Getstart(),
                        )));
                  },
                  child: Icon(
                    Icons.logout,
                    size: 30,
                  ),
                )),
          )
        ],
        backgroundColor: secondaryColor,
        title: Text("Authentificated"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
    );
  }
}
