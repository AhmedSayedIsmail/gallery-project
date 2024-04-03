import 'package:flutter/material.dart';

extension NavigateTo on BuildContext {
  goTo({required screen}) =>
      Navigator.push(this, MaterialPageRoute(builder: (context) => screen));

  goBack() => Navigator.pop(this);

  goBackMultiTime() => Navigator.of(this)
    ..pop()
    ..pop();

  goToAndKillLastWidget({required screen}) => Navigator.pushAndRemoveUntil(
      this, MaterialPageRoute(builder: (context) => screen), (route) => false);
}

extension UserInputValidations on String {
  bool get isValidEmail => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);
  bool get isValidPassword =>
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(this);
  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";
}

