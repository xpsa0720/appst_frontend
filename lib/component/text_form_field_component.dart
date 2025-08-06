import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatelessWidget {
  final double? width;
  final double? height;
  final String? hint;
  final TextEditingController controller;
  final bool isPassword;
  const TextFormFieldComponent({
    super.key,
    this.width,
    this.height,
    this.hint,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        cursorColor: Colors.black,
        style: TextStyle(fontFamily: "NanumSquareRound"),
        decoration: InputDecoration(
          hoverColor: Colors.transparent,
          focusColor: Colors.black,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          labelText: hint ?? "",
        ),
        autofocus: true,
      ),
    );
  }
}
