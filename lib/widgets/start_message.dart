import 'package:flutter/material.dart';

class StartMessage extends StatelessWidget {
  const StartMessage({
    Key? key,
    required this.titleStyle,
  }) : super(key: key);

  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: [
            Text(
              "Deine Job",
              style: titleStyle,
            ),
            Text(
              "website",
              style: titleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
