import 'package:flutter/material.dart';

import '../helpers/color_from_hex.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: colorFromHex("#4A5568"),
        fontSize: 21,
      ),
    );
  }
}
