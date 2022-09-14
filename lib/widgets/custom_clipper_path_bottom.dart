import 'package:flutter/material.dart';

class CustomClipperPathBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.8882286);
    path.quadraticBezierTo(size.width * -0.0164333, size.height * 0.9476143, 0,
        size.height * 0.1322429);
    path.quadraticBezierTo(size.width * 0.3269417, size.height * 0.1631857,
        size.width * 0.5158750, size.height * 0.0617143);
    path.quadraticBezierTo(size.width * 0.7069750, size.height * -0.0169571,
        size.width, size.height * 0.0155143);
    path.quadraticBezierTo(size.width * 1.0048167, size.height * 0.6467143,
        size.width, size.height * 0.8631571);
    path.cubicTo(
        size.width * -0.0114667,
        size.height * 0.8625429,
        size.width * -0.0437583,
        size.height * 0.8619571,
        0,
        size.height * 0.8604429);
    path.close();

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
