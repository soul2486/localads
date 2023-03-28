import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localads/provider/auth_provider.dart';
import 'package:localads/screens/Otpcode_screen.dart';
import 'package:localads/utilis/constant.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_button.dart';

class Authscreen extends StatefulWidget {
  Authscreen({Key? key}) : super(key: key);

  @override
  State<Authscreen> createState() => _AuthscreenState();
}

class _AuthscreenState extends State<Authscreen> {
  final TextEditingController phoneController = TextEditingController();
  String codepays = "+237";
  // Container _check = Container();
  final _auth = FirebaseAuth.instance;
  // void initState() {
  //   super.initState();
  //   _check = Container();
  // }
  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "${codepays + phoneNumber}");
  }

  bool loading = false;
  String phoneNumb = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white60,
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  // height: 250,
                  // padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(),
                  child: SvgPicture.asset(
                    height: 250,
                    "assets/images/undraw_sign__up_nm4k.svg",
                    // color: primaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    "Inscription",
                    style: text1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    "ajoutez votre numéro de téléphone. Nous vous enverrons un code de vérification afin que nous sachions que vous êtes réel.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(96, 14, 13, 13),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 30.0),
                  child: TextFormField(
                    onChanged: (value) {
                      phoneNumb = value;
                      setState(() {});
                    },
                    cursorColor: primaryColor,
                    controller: phoneController,
                    decoration: InputDecoration(
                      prefixIcon: CountryCodePicker(
                        onChanged: (code) {
                          setState(() {
                            codepays = code.toString();
                            print(codepays);
                          });
                        },
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'CM',
                        favorite: ['+39', 'FR'],
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,
                        dialogSize: Size(20, 400),
                      ),
                      hintText: "Entrer votre numero",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                customButton(
                  onclick: phoneNumb.length < 9 && !loading
                      ? null
                      : (() async {
                          // setState(() {});
                          loading = !loading;
                          setState(() {});
                          sendPhoneNumber();
                        }),
                  elementChild: loading
                      ? CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        )
                      : Text(
                          "Suivant",
                          style: TextStyle(color: Colors.white),
                        ),
                  colorBack:
                      phoneNumb.length < 9 && !loading ? null : secondaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
