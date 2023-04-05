import 'package:flutter/material.dart';
import 'package:localads/utilis/constant.dart';

class customButton extends StatelessWidget {
  Widget? elementChild;
  final VoidCallback? onclick;
  Color colorText;
  Color? colorBack;
  customButton(
      {super.key,
      required this.onclick,
      required this.elementChild,
      this.colorBack = secondaryColor,
      this.colorText = textWhite});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        enableFeedback: true,
        elevation: MaterialStateProperty.all(10),
        shadowColor: MaterialStateProperty.all(
          Color.fromARGB(237, 226, 225, 225),
        ),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 15, vertical: 13)),
        backgroundColor: MaterialStateProperty.all(
          colorBack,
        ),
      ),
      onPressed: onclick,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: elementChild),
    );
  }
}
