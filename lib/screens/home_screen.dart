import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:localads/models/annonce.dart';
import 'package:localads/provider/auth_provider.dart';
import 'package:localads/screens/publish_screen.dart';
import 'package:localads/screens/splash_screen.dart';
import 'package:localads/services/annonce_service.dart';
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
  CollectionReference _annonce =
      FirebaseFirestore.instance.collection('annonces');
  late Stream<QuerySnapshot> _streamAnnonce;
  // FirebaseFirestore.instance.collection('annonces').snapshots();
  List<QueryDocumentSnapshot> listQueryDocumentSnapshot = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamAnnonce = _annonce.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    List<Annonce> annonce = [];
    AnnonceService annonceService = new AnnonceService();
    // initState() async {
    //   annonce = await annonceService.getAllAnnonces();
    // }

    // initState(() {
    //   annonce = annonceService.getAllAnnonces();
    // });
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
        child: SingleChildScrollView(
          child: Row(
            children: [
              Column(
                children: [
                  StreamBuilder(
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Text("Error $snapshot");
                      } else if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      } else {
                        QuerySnapshot querySnapshot = snapshot.data;
                        listQueryDocumentSnapshot.addAll(querySnapshot.docs);
                      }
                      // if (snapshot.connectionState == ConnectionState.waiting) {
                      //   return Text("Loading...");
                      // }
                      return Column(
                        children: [
                          for (var item in listQueryDocumentSnapshot)
                            Text(item['categorie']),
                          SizedBox(
                            height: 20,
                          )
                          // ListView(
                          //   children: snapshot.data!.docs
                          //       .map((DocumentSnapshot document) {
                          //     Map<String, dynamic> data =
                          //         document.data()! as Map<String, dynamic>;
                          //     return ListTile(
                          //       title: Text(data['titre']),
                          //       subtitle: Text(data['description']),
                          //     );
                          //   }).toList(),
                          // ),
                        ],
                      );
                    },
                    stream: _streamAnnonce,
                  ),
                ],
              ),
              Text("$annonce"),
              Column(
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
            ],
          ),
        ),
      ),
    );
  }
}
