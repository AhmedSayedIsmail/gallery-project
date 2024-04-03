import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeImageContainer extends StatelessWidget {
  final File image;
  const CustomeImageContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      height: 110.h,
      decoration: BoxDecoration(
          image: DecorationImage(image: FileImage(image)),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
