import 'package:flutter/material.dart';

import '../helpers/color_from_hex.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.isMobile,
    required this.isDesktop,
  }) : super(key: key);
  final bool isMobile;
  final bool isDesktop;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 80.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isLoggedin = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late bool showUnderline = false;
    return Container(
      height: widget.isMobile ? 80.0 : 50.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        // borderRadius: const BorderRadius.only(
        //   bottomLeft: Radius.circular(16.0),
        //   bottomRight: Radius.circular(16.0),
        // ),
      ),
      child: Material(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15), top: Radius.zero),
        ),
        elevation: 4,
        child: Column(
          children: [
            Container(
              height: 4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                colorFromHex("#319795"),
                colorFromHex("#3182CE"),
              ])),
            ),
            InkWell(
              onHover: (hovered) {
                setState(() {
                  print(hovered);
                  showUnderline = hovered;
                });
              },
              child: Container(
                  margin: EdgeInsets.only(
                      top: widget.isMobile ? 45 : 15, right: 30),
                  alignment: Alignment.centerRight,
                  child: widget.isMobile
                      ? Text(
                          "Login",
                          style: TextStyle(
                            color: colorFromHex("#319795"),
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            decoration: showUnderline
                                ? TextDecoration.underline
                                : TextDecoration.none,
                          ),
                        )
                      : Container(
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(),
                              Row(
                                children: [
                                  if (isLoggedin)
                                    Text(
                                      "Jetzt Klicken",
                                      style: TextStyle(
                                        color: colorFromHex("#4A5568"),
                                        fontSize: 14,
                                      ),
                                    ),
                                  if (isLoggedin)
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  if (isLoggedin)
                                    Container(
                                      padding: const EdgeInsets.only(
                                        top: 4,
                                        bottom: 4,
                                        right: 16,
                                        left: 16,
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1,
                                            color: Colors.grey.shade200,
                                          ),
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20, left: 20, bottom: 2),
                                        child: Text(
                                          "Kostenlos Registrieren",
                                          style: TextStyle(
                                              color: colorFromHex("#319795")),
                                        ),
                                      ),
                                    ),
                                  if (isLoggedin) const SizedBox(width: 20),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isLoggedin = !isLoggedin;
                                      });
                                    },
                                    child: Text(
                                      isLoggedin ? "Logout" : 'Login',
                                      style: TextStyle(
                                        color: colorFromHex("#319795"),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        decoration: showUnderline
                                            ? TextDecoration.underline
                                            : TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
            ),
          ],
        ),
      ),
    );
  }

  Size get preferredSize => const Size(double.infinity, 80.0);
}
