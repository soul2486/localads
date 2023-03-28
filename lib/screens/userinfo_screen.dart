import 'dart:io';

import 'package:flutter/material.dart';
import 'package:localads/models/user.dart';
import 'package:localads/provider/auth_provider.dart';
import 'package:localads/screens/home_screen.dart';
import 'package:localads/utilis/constant.dart';
import 'package:localads/utilis/helpers.dart';
import 'package:localads/widgets/custom_button.dart';
import 'package:localads/widgets/input_field.dart';
import 'package:provider/provider.dart';

class UserInfoScreen extends StatefulWidget {
  // late var auth = FirebaseAuth.instance;

  UserInfoScreen({
    Key? key,
  }) : super(key: key);
  // final _auth = FirebaseAuth.instance;

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  File? image;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final entrepriseController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose

    nameController.dispose();
    emailController.dispose();
    entrepriseController.dispose();
    super.dispose();
  }

  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        entreprise: entrepriseController.text.trim(),
        profilePic: "",
        createdAd: "",
        phoneNumber: "",
        uid: "");
    if (image != null) {
      ap.saveUserDataToFirebase(
          context: context,
          userModel: userModel,
          profilePic: image!,
          onSuccess: () {
            ap.saveUserDataToSp().then((value) => ap.setSignIn().then((value) =>
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: ((context) {
                    print("DEDANSSSSSS");
                    return HomeScreen();
                  }),
                ), (route) => false)));
          });
    } else {
      showSnackbar(context, "Veuillez choisir votre photo");
    }
  }

  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isloading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: SafeArea(
        child: isloading == true
            ? Center(
                child: CircularProgressIndicator(
                  color: secondaryColor,
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () => selectImage(),
                        child: image == null
                            ? CircleAvatar(
                                backgroundColor: secondaryColorOpacity,
                                radius: 75,
                                child: Icon(
                                  Icons.account_circle,
                                  size: 80,
                                  color: Colors.white,
                                ),
                              )
                            : CircleAvatar(
                                backgroundImage: FileImage(image!),
                                radius: 50,
                              )),
                    Input_field(
                      icon: Icons.account_circle,
                      inputType: TextInputType.name,
                      controller: nameController,
                      hintext: " Nom ou Pseudo",
                    ),
                    Input_field(
                      icon: Icons.email_rounded,
                      inputType: TextInputType.emailAddress,
                      controller: emailController,
                      hintext: "Email",
                    ),
                    Input_field(
                      icon: Icons.account_balance_outlined,
                      inputType: TextInputType.name,
                      controller: entrepriseController,
                      hintext: "Nom de votre Entreprise",
                      helpertext: "Optionnel",
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    customButton(
                      onclick: () {
                        print(nameController.text);
                        print(emailController.text);
                        print(entrepriseController.text);
                        storeData();
                      },
                      elementChild: Text("Continuer"),
                      colorBack: secondaryColor,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
