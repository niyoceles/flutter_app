import 'package:flutter/material.dart';

class CustomClipperPathCenter extends CustomClipper<Path> {
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
    path.quadraticBezierTo(size.width * 1.0042667, size.height * 0.6669571,
        size.width, size.height * 0.8872714);
    path.cubicTo(
        size.width * 0.7034167,
        size.height * 0.8392429,
        size.width * 0.5190667,
        size.height * 0.9562571,
        size.width * 0.4303833,
        size.height * 0.9567429);
    path.cubicTo(
        size.width * 0.2690667,
        size.height * 0.9600143,
        size.width * 0.1135000,
        size.height * 0.8494000,
        0,
        size.height * 0.8882286);
    path.close();

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
