import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localads/provider/auth_provider.dart';
import 'package:localads/screens/Man.dart';
import 'package:localads/screens/auth_screen.dart';
import 'package:localads/screens/home_screen.dart';
import 'package:localads/utilis/constant.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../widgets/custom_button.dart';
import 'Accueil_screen.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final ap = Provider.of<AuthProvider>(context, listen: true);
    // if (ap.isSingnedIn == true) {
    //   ap.getDataFromSp().whenComplete(() => HomeScreen());
    // } else {
    //   Getstart s = Getstart();
    // }
  }

  Widget apresSplash(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: true);
    if (ap.isSingnedIn == true) {
      // ap.getDataFromSp().whenComplete(
      //   () {
      //     return Navigator.pushReplacement(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => HomeScreen(),
      //       ),
      //     );
      //   },
      // );
      ap.getDataFromSp();
      return MyWidget();
      // ap.getDataFromSp().whenComplete(() => null);
    } else {
      return Getstart();
    }

    // return Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => Getstart(),
    //     ));
  }

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: true);

    return SplashScreenView(
      // pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
      // navigateRoute: StreamBuilder<User?>(
      //     // stream: ,
      //     // builder: (context, snapshot) {
      //     //   if (ap.isSingnedIn == true) {
      //     //     return HomeScreen();
      //     //   } else {
      //     //     return Getstart();
      //     //   }
      //     // },
      //     ),
      duration: 10000,
      imageSize: 130,
      imageSrc: "assets/images/gets.png",
      text: "LocalAds",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(fontSize: 40.0, color: Colors.white),
      colors: [
        Color.fromARGB(255, 30, 0, 161),
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      navigateRoute: apresSplash(context),
    );
  }
}

class Getstart extends StatelessWidget {
  const Getstart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // appBar: AppBar(),
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/start.svg",
                height: 250,
                width: 100,
                // color: Color.fromARGB(255, 241, 144, 137),
              ),

              // Image.asset(
              //   height: 250,
              //   "assets/images/undraw_Welcome_re_h3d9.png",
              //   // color: primaryColor,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Let's get started !",
                  style: text1,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: Text(
                  textAlign: TextAlign.center,
                  "jamais un meilleur moment que maintenant pour commencer",
                  style: normal,
                ),
              ),
              // ImageIcon(AssetImage("assets/images/getstart.png")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customButton(
                  onclick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Authscreen()));
                  },
                  elementChild: Text("Commencer"),
                  colorBack: secondaryColor,
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: customButton(
              //     onclick: (() {}),
              //     elementChild: Text("Se connecter"),
              //     colorBack: textWhite,
              //     colorText: secondaryColor,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
