import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:localads/models/user.dart';
import 'package:localads/screens/Otpcode_screen.dart';
import 'package:localads/utilis/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String? _uid;
  String get uid => _uid!;
  bool _isLoading = false;
  bool _isSignedIn = false;
  bool get isSingnedIn => _isSignedIn;
  bool get isLoading => _isLoading;
  UserModel? _userModel;
  UserModel get userModel => _userModel!;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  // UserModel? _userModel = UserModel(
  //   createdAd: "",
  //   email: "",
  //   entreprise: "",
  //   name: "",
  //   phoneNumber: "",
  //   profilePic: "",
  //   uid: "",
  // );

  AuthProvider() {
    checkSign();
  }
  void checkSign() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("is_signedin") ?? false;
    notifyListeners();
  }

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (error) {
          throw Exception(error.message);
        },
        codeSent: (verificationId, forceResendingToken) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  verificationScreen(verificationId: verificationId),
            ),
          );
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message.toString());
    }
  }

  void verifierCode({
    required BuildContext context,
    required String verificationId,
    required String userCode,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userCode);
      User? user = (await _auth.signInWithCredential(creds)).user;
      if (user != null) {
        _uid = user.uid;
        print(_uid!.toUpperCase());
        onSuccess();
      }
      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message.toString());
    }
  }

  Future getDataFromSp() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    String data = s.getString("user_model") ?? '';
    _userModel = UserModel.fromMap(jsonDecode(data));
    _uid = _userModel!.uid;
    notifyListeners();
  }

  Future getDataFromFirestore() async {
    await _firebaseFirestore
        .collection("utilisateurs")
        .doc(_auth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      _userModel = UserModel(
        name: snapshot['name'],
        email: snapshot['email'],
        entreprise: snapshot['entreprise'],
        profilePic: snapshot['profilePic'],
        createdAd: snapshot['createdAd'],
        phoneNumber: snapshot['phoneNumber'],
        uid: uid,
      );
      _uid = userModel.uid;
    });
  }

  Future userSignOut() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    await _auth.signOut();
    _isSignedIn = false;
    notifyListeners();
    s.clear();
  }

  Future setSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool("is_signedin", true);
    _isSignedIn = true;
    notifyListeners();
  }

  Future<bool> checkExistingUser() async {
    DocumentSnapshot snapshot =
        await _firebaseFirestore.collection("utilisateurs").doc(_uid).get();
    if (snapshot.exists) {
      print("User Exist");
      return true;
    } else {
      print("New user");
      return false;
    }
  }

  void saveUserDataToFirebase(
      {required BuildContext context,
      required UserModel userModel,
      required File profilePic,
      required Function onSuccess}) async {
    _isLoading = true;
    notifyListeners();
    try {
      await storeFileToStorage("profilePic/$_uid", profilePic).then((value) {
        userModel.profilePic = value;
        userModel.createdAd = DateTime.now().millisecondsSinceEpoch.toString();
        userModel.phoneNumber = _auth.currentUser!.phoneNumber!;
        userModel.uid = _auth.currentUser!.phoneNumber!;
      });
      _userModel = userModel;

      // Upload to firebase Storage;
      await _firebaseFirestore
          .collection("utilisateurs")
          .doc(uid)
          .set(userModel.toMap())
          .then((value) {
        onSuccess();
        _isLoading = false;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String> storeFileToStorage(String ref, File file) async {
    UploadTask uploadTask = _firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future saveUserDataToSp() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await s.setString("user_model", jsonEncode(userModel.toMap()));
  }
}
