import 'package:flutter/material.dart';
import 'package:localads/utilis/constant.dart';

class Input_field extends StatelessWidget {
  String? hintext;
  IconData icon;
  TextInputType inputType;
  TextEditingController controller;
  String? helpertext;
  Input_field(
      {Key? key,
      this.hintext,
      required this.icon,
      required this.inputType,
      required this.controller,
      this.helpertext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: TextFormField(
        controller: controller,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              size: 20,
            ),
            fillColor: secondaryColorOpacity,
            filled: true,
            // enabledBorder: ,
            // helperStyle: TextStyle(),
            helperText: helpertext,
            hintText: hintext,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 237, 238, 240)))),
      ),
    );
  }
}
