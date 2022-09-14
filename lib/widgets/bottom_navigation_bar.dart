import 'package:flutter/material.dart';

import 'app_button.dart';

Widget bottomNavigationBar() {
  return Container(
    padding: const EdgeInsets.only(top: 3),
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
    ),
    child: Container(
      height: 90,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: SizedBox(
        height: 50,
        child: AppButton(
          text: "Kostenlos Registrieren",
        ),
      ),
    ),
  );
}
