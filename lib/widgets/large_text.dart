import 'package:flutter/material.dart';

import '../helpers/color_from_hex.dart';

class LargeText extends StatelessWidget {
  const LargeText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: colorFromHex("#718096"), fontSize: 130, fontFamily: 'Regular'),
    );
  }
}
