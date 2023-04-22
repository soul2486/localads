import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:localads/models/annonce.dart';

class AnnonceService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> publierAnnonce(Annonce annonce) async {
    try {
      final currentUser = _auth.currentUser;
      final userUid = currentUser?.uid;
      final userDisplayName = currentUser?.displayName ?? "Anonyme";

      final annonceMap = annonce.toMap();

      annonceMap.addAll({
        "userId": userUid,
        "userName": userDisplayName,
        "creationDate": "",
      });

      await _firestore.collection("annonces").add(annonceMap);
    } catch (e) {
      print(e.toString());
      throw "Erreur lors de la publication de l'annonce.";
    }
  }

  Stream<List<Annonce>> getAllAnnonces() {
    List<Annonce> annonces = [];
    // QuerySnapshot querySnapshot =
    //     FirebaseFirestore.instance.collection('annonces').get();

    // querySnapshot.docs.forEach((document) {
    //   annonces.add(
    //     Annonce.fromMap(
    //       jsonDecode(document.data().toString()),
    //     ),
    //   );
    // });

    return FirebaseFirestore.instance.collection('annonces').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((e) => Annonce.fromMap(e.data())).toList());
    ;
  }
}
