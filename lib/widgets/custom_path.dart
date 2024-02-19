import 'package:flutter/material.dart';

class CustomPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0); //1
    path.lineTo(0, 479); //2
    path.lineTo(0, 479); //3 kon 4
    path.quadraticBezierTo(
        size.width * 0.5, size.height - 225, size.width, 479);
    path.lineTo(size.width, 0); //5
    path.close(); //6

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}