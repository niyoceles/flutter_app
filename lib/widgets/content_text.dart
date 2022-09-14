import 'package:flutter/material.dart';

import '../helpers/color_from_hex.dart';

class ContentText extends StatelessWidget {
  const ContentText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: colorFromHex("#718096"),
        fontSize: 15.75,
      ),
    );
  }
}
