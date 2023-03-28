import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localads/provider/auth_provider.dart';
import 'package:localads/screens/home_screen.dart';
import 'package:localads/screens/userinfo_screen.dart';
import 'package:localads/utilis/constant.dart';
import 'package:localads/utilis/helpers.dart';
import 'package:localads/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class verificationScreen extends StatefulWidget {
  // final String phone;
  String verificationId;
  // final String code;
  verificationScreen({
    Key? key,
    required this.verificationId,
    // required this.phone,
    // required this.code,
  }) : super(key: key);

  @override
  State<verificationScreen> createState() => _verificationScreenState();
}

class _verificationScreenState extends State<verificationScreen> {
  final GlobalKey<ScaffoldState> _scaffolkey = GlobalKey<ScaffoldState>();
  TextEditingController codeController = TextEditingController();
  FocusNode codeFocus = FocusNode();
  String smsCode = "";
  String? verifcationCode;
  bool resend = false;
  late Timer timer;
  int count = 30;
  bool loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    decompte();
  }

  void verifierCode(BuildContext context, String userCode) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    ap.verifierCode(
      context: context,
      verificationId: widget.verificationId,
      userCode: userCode,
      onSuccess: () {
        // await ap.getDataFromSp();
        ap.checkExistingUser().then((value) {
          if (value == true) {
            print("Yesss");
            // await ap.getDataFromSp().whenComplete(() => null);
            ap.getDataFromFirestore().then(
                  (value) => ap.saveUserDataToSp().then(
                        (value) => ap.setSignIn().then(
                              (value) => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => HomeScreen()),
                                  ),
                                  (route) => false),
                            ),
                      ),
                );
          } else {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => UserInfoScreen(),
                ),
                (route) => false);
          }
        });
      },
    );
    // } catch (e) {
    //   showSnackbar(context, e.toString());
    // }
  }

  void decompte() {
    timer = Timer.periodic(Duration(seconds: 1), ((t) {
      if (count < 1) {
        timer.cancel();
        count = 30;
        resend = true;
        setState(() {});
        return;
      }
      count--;
      setState(() {});
    }));
  }

  final _auth = FirebaseAuth.instance;
  Future<void> verifierNumero(String smsCode, String verificationId) async {
    try {
      final _credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      await _auth.signInWithCredential(_credential);
      return;
    } catch (e) {
      loading = !loading;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Code incorrect, veuillez reessayer SVP !",
          ),
          duration: Duration(seconds: 30),
        ),
      );
    }
  }

  void verifierSms() async {
    loading = true;
    setState(() {});
    await verifierNumero(smsCode, widget.verificationId);
    loading = !loading;
    setState(() {});
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserInfoScreen(),
        ));
    // setState(() {});
  }

  // void onResendSmsCode() {
  //   resend = false;
  //   setState(() {});
  //   FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: '${widget.code + widget.phone}',
  //     verificationCompleted: (phoneAuthCredential) async {
  //       await _auth.signInWithCredential(phoneAuthCredential);
  //     },
  //     timeout: Duration(seconds: 30),
  //     verificationFailed: (error) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(
  //             error.toString(),
  //           ),
  //           duration: Duration(seconds: 30),
  //         ),
  //       );
  //     },
  //     codeSent: (verificationId, forceResendingToken) {
  //       // loading = false;
  //       resend = false;
  //       setState(() {});

  //       // loading = false;
  //       // setState(() {});
  //     },
  //     codeAutoRetrievalTimeout: (verificationId) {},
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: SafeArea(
          child: isLoading == true
              ? Center(
                  child: CircularProgressIndicator(
                    color: secondaryColor,
                  ),
                )
              : SingleChildScrollView(
                  child: Container(
                    // height: double.maxFinite,
                    width: double.maxFinite,
                    color: Color.fromARGB(90, 231, 230, 230),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: SvgPicture.asset(
                              "assets/images/undraw_authentication_re_svpt.svg",
                              height: 150,
                            ),
                          ),
                          Text(
                            "Verification",
                            style: text1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Entrer votre code de verificarion",
                            style: normal,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 200,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: textWhite,
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Pinput(
                                    onCompleted: (value) {
                                      setState(() {
                                        smsCode = value;
                                      });
                                    },
                                    pinAnimationType: PinAnimationType.rotation,
                                    controller: codeController,
                                    focusNode: codeFocus,
                                    length: 6,
                                  ),
                                ),
                                customButton(
                                  onclick: smsCode.length < 6
                                      ? null
                                      : () {
                                          verifierCode(context, smsCode);
                                          // verifierSms();
                                        },
                                  elementChild: loading
                                      ? CircularProgressIndicator(
                                          strokeWidth: 3,
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.white),
                                        )
                                      : Text("Verifier"),
                                  colorBack: smsCode.length < 6
                                      ? null
                                      : secondaryColor,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Vous n'avez pas recu le code ?",
                            style: normal,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: resend
                                ? null
                                : () {
                                    // onResendSmsCode();
                                  },
                            child: Text(
                              !resend
                                  ? "00:${count.toString().padLeft(2, "0")}"
                                  : "Renvoyez un nouveau Code ",
                              style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
    );
  }
}
