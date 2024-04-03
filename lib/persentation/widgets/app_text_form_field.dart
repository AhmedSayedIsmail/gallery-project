import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintName;
  final bool ispass;
  final String? Function(String?) validator;
  final Function(String)? onsubmit;
  final double? fontSize;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  const AppTextFormField(
      {super.key,
      this.hintName,
      required this.controller,
      required this.validator,
      this.ispass = false,
      this.onsubmit,
      this.textInputAction,
      this.fontSize});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: ispass,
      validator: validator,
      textInputAction: textInputAction,
      onFieldSubmitted: onsubmit,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0x000ac9fe))),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color(0x000ac9fe)),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: Colors.red),
        ),
        hintText: hintName,
        hintStyle: TextStyle(fontSize: fontSize),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
