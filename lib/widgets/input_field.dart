import 'package:flutter/material.dart';
import 'package:localads/utilis/constant.dart';

class Input_field extends StatelessWidget {
  String? hintext;
  String? suffix;
  IconData? icon;
  TextInputType inputType;
  TextEditingController controller;
  String? helpertext;
  int? maxline;
  Input_field({
    Key? key,
    this.hintext,
    this.suffix,
    this.icon,
    required this.inputType,
    required this.controller,
    this.helpertext,
    this.maxline = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
      child: TextFormField(
        maxLines: maxline,
        controller: controller,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 77, 76, 76)),
        decoration: InputDecoration(
          suffixText: suffix,
          label: Text("$hintext"),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color.fromARGB(92, 141, 141, 141)),
          ),
          alignLabelWithHint: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color.fromARGB(92, 141, 141, 141)),
          ),
          prefixIcon: Icon(
            icon,
            size: 20,
          ),
          fillColor: secondaryColorOpacity,
          // filled: true,
          // enabledBorder: ,
          // helperStyle: TextStyle(),
          helperText: helpertext,
          // hintText: hintext,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
