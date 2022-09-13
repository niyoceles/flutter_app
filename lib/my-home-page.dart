import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/large_text.dart';
import 'package:flutter_app/widgets/title_text.dart';

import 'helpers/color_from_hex.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final cupertinoMap = <int, Widget>{};

  //The Widgets that has to be loaded when a tab is selected.
  late List<Widget> childWidgets;
  late List<String> cupertinoSegmentedTitles;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    cupertinoSegmentedTitles = ['Arbeitnehmer', 'Arbeitgeber', 'Temporärbüro'];
    loadCupertinoTabs();
    loadCupertinoChildWidgets();
  }

  void loadCupertinoTabs() {
    for (var i = 0; i < 3; i++) {
      cupertinoMap.putIfAbsent(
        i,
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(cupertinoSegmentedTitles[i]),
        ),
      );
    }
  }

  void loadCupertinoChildWidgets() {
    childWidgets = [];
    for (var i = 0; i < 3; i++) {
      childWidgets.add(
        Column(
          children: [
            if (i == 0)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const TitleText(
                        text: 'Drei einfache Schritte',
                      ),
                      const TitleText(
                        text: 'zu deinem neuen Job',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(top: 100),
                              child: const LargeText(
                                text: '1.',
                              )),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                child: Image.asset(
                                    "assets/images/undraw_Profile_data_re_v81r.png"),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Erstellen dein Lebenslauf",
                                style: TextStyle(
                                  color: colorFromHex("#718096"),
                                  fontSize: 15.75,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      );
    }
  }

  Widget childWidget() {
    return childWidgets.elementAt(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.of(context).size.shortestSide < 600;
    var isDesktop = MediaQuery.of(context).size.shortestSide >= 600;
    var titleStyle = TextStyle(
      fontSize: 42,
      color: colorFromHex("#2D3748"),
      letterSpacing: 1.26,
    );
    return Scaffold(
      appBar: const CustomAppBar(),
      // appBar: AppBar(
      // shape: const Border(
      //     top: BorderSide(
      //   color: Colors.green,
      //   width: 4,
      // )),

      //   // shape: const RoundedRectangleBorder(
      //   //   borderRadius: BorderRadius.vertical(
      //   //       bottom: Radius.circular(10), top: Radius.zero),
      //   // ),
      //   // // elevation: 4,
      //   // backgroundColor: Colors.white,
      //   title: const Text('Responsive app'),

      // ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 4, left: 0, right: 0, bottom: 0),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            colorFromHex("#E6FFFA"),
            colorFromHex("#EBF4FF"),
          ])),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
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
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  padding: EdgeInsets.zero,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage("assets/images/undraw_agreement_aajr.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ClipPath(
                  clipper: CustomClipperPath2(),
                  child: Container(
                    // padding: const EdgeInsets.only(top: 0),
                    margin: const EdgeInsets.only(top: 0),
                    height: MediaQuery.of(context).size.height * 0.8,
                    color: Colors.white,
                    child: Container(
                      margin: const EdgeInsets.only(top: 100, left: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Row(
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: CupertinoSegmentedControl<int>(
                                      onValueChanged: (value) =>
                                          setState(() => selectedIndex = value),
                                      children: cupertinoMap,
                                      padding: const EdgeInsets.all(0),
                                      groupValue: selectedIndex,
                                      selectedColor: colorFromHex("#81E6D9"),
                                      pressedColor: colorFromHex("#E6FFFA"),
                                      unselectedColor: Colors.white,
                                      borderColor: Colors.grey.shade300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: childWidget(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 150),
                      child: Text(
                        "2.",
                        style: TextStyle(
                            color: colorFromHex("#718096"),
                            fontSize: 130,
                            fontFamily: 'Regular'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 80),
                      child: Column(
                        children: [
                          Text(
                            "Erstellen dein Lebenslauf",
                            style: TextStyle(
                              color: colorFromHex("#718096"),
                              fontSize: 15.75,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 20),
                            child: Image.asset(
                                "assets/images/undraw_task_31wc.png"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ClipPath(
                  clipper: CustomClipperPath2(),
                  child: Container(
                    margin: const EdgeInsets.only(top: 0),
                    height: MediaQuery.of(context).size.height * 0.8,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 60),
                              padding: const EdgeInsets.only(left: 80),
                              child: Text(
                                "3.",
                                style: TextStyle(
                                    color: colorFromHex("#718096"),
                                    fontSize: 130,
                                    fontFamily: 'Regular'),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(top: 70),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mit nur einem Klick",
                                    style: TextStyle(
                                      color: colorFromHex("#718096"),
                                      fontSize: 15.75,
                                    ),
                                  ),
                                  Text(
                                    "bewerben",
                                    style: TextStyle(
                                      color: colorFromHex("#718096"),
                                      fontSize: 15.75,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 100),
                          padding: const EdgeInsets.only(right: 50, left: 50),
                          child: Image.asset(
                              "assets/images/undraw_personal_file_222m.png"),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 100.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    late bool showUnderline = false;
    return Container(
      height: 60.0,
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
              bottom: Radius.circular(10), top: Radius.zero),
        ),
        elevation: 4,
        child: Column(
          children: [
            Container(
              height: 4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      // begin: Alignment.topLeft,
                      // end: Alignment.topRight,
                      colors: [
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
                  margin: const EdgeInsets.only(top: 20, right: 15),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: colorFromHex("#319795"),
                      fontSize: 14,
                      decoration: showUnderline
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Size get preferredSize => const Size(double.infinity, 100.0);
}

class CustomClipperPath1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height * 0.9248857);
    path0.lineTo(0, size.height * 0.5048571);
    path0.quadraticBezierTo(size.width * 0.3352333, size.height * 0.5581286,
        size.width * 0.5630333, size.height * 0.3387571);
    path0.quadraticBezierTo(size.width * 0.6928667, size.height * 0.1763286,
        size.width, size.height * 0.2189429);
    path0.lineTo(size.width, size.height * 0.0022143);
    path0.lineTo(size.width * 0.9992667, size.height * 0.9305000);
    path0.lineTo(0, size.height * 0.9248857);
    path0.close();

    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomClipperPath2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height * 0.8882286);
    path0.quadraticBezierTo(size.width * -0.0164333, size.height * 0.9476143, 0,
        size.height * 0.1322429);
    path0.quadraticBezierTo(size.width * 0.3269417, size.height * 0.1631857,
        size.width * 0.5158750, size.height * 0.0617143);
    path0.quadraticBezierTo(size.width * 0.7069750, size.height * -0.0169571,
        size.width, size.height * 0.0155143);
    path0.quadraticBezierTo(size.width * 1.0042667, size.height * 0.6669571,
        size.width, size.height * 0.8872714);
    path0.cubicTo(
        size.width * 0.7034167,
        size.height * 0.8392429,
        size.width * 0.5190667,
        size.height * 0.9562571,
        size.width * 0.4303833,
        size.height * 0.9567429);
    path0.cubicTo(
        size.width * 0.2690667,
        size.height * 0.9600143,
        size.width * 0.1135000,
        size.height * 0.8494000,
        0,
        size.height * 0.8882286);
    path0.close();

    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
