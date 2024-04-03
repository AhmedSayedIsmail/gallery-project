import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextWidget extends StatelessWidget {
  final String? text;
  final double? fontsize;
  final TextAlign? textAlign;
  const AppTextWidget({super.key, this.text, this.fontsize, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        textAlign: textAlign,
        style: TextStyle(
            fontSize: fontsize?.sp,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(74, 74, 74, 1)));
  }
}
