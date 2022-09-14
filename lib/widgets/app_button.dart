import 'package:flutter/material.dart';
import 'package:flutter_app/helpers/color_from_hex.dart';

class AppButton extends StatelessWidget {
  AppButton({
    Key? key,
    this.text,
    this.width = 50,
  }) : super(key: key);
  String? text;
  double width;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              colorFromHex("#319795"),
              colorFromHex("#3182CE"),
            ])),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
                color: colorFromHex("#E6FFFA"),
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}
