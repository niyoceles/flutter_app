import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/content_text.dart';
import 'package:flutter_app/widgets/custom_clipper_path_bottom.dart';
import 'package:flutter_app/widgets/custom_clipper_path_center.dart';
import 'package:flutter_app/widgets/large_text.dart';
import 'package:flutter_app/widgets/title_text.dart';

import 'helpers/color_from_hex.dart';
import 'widgets/app_button.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/start_message.dart';

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

  void loadCupertinoChildWidgets(bool isMobile, bool isDesktop) {
    childWidgets = [];
    for (var i = 0; i < 3; i++) {
      childWidgets.add(
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                if (i == 0)
                  Column(
                    children: const [
                      TitleText(
                        text: 'Drei einfache Schritte',
                      ),
                      TitleText(
                        text: 'zu deinem neuen Job',
                      ),
                    ],
                  ),
                if (i == 1)
                  Column(
                    children: const [
                      TitleText(
                        text: 'Drei einfache Schritte',
                      ),
                      TitleText(
                        text: 'zu deinem neuen Mitarbeiter',
                      ),
                    ],
                  ),
                if (i == 2)
                  Column(
                    children: const [
                      TitleText(
                        text: 'Drei einfache Schritte zur ',
                      ),
                      TitleText(
                        text: 'Vermittlung neuer Mitarbeiter',
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                if (isMobile)
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
                            height: 25,
                          ),
                          if (i == 0)
                            const ContentText(
                                text: "Erstellen dein Lebenslauf"),
                          if (i != 0)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                ContentText(text: "Erstellen dein"),
                                ContentText(text: "Unternehmensprofil")
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                if (isDesktop)
                  Container(
                    padding: const EdgeInsets.only(right: 150, left: 150),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 100),
                                child: const LargeText(
                                  text: '1.',
                                )),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 175,
                                ),
                                if (i == 0)
                                  const ContentText(
                                      text: "Erstellen dein Lebenslauf"),
                                if (i != 0)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      ContentText(text: "Erstellen dein"),
                                      ContentText(text: "Unternehmensprofil")
                                    ],
                                  ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(right: 100),
                          padding: const EdgeInsets.only(top: 80, right: 250),
                          child: Image.asset(
                              "assets/images/undraw_Profile_data_re_v81r.png"),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
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

    loadCupertinoChildWidgets(isMobile, isDesktop);

    var titleStyle = TextStyle(
      fontSize: 42,
      color: colorFromHex("#2D3748"),
      letterSpacing: 1.26,
    );
    return Scaffold(
      appBar: CustomAppBar(
        isMobile: isMobile,
        isDesktop: isDesktop,
      ),
      body: Stack(children: [
        Positioned(
          child: Container(
            padding:
                const EdgeInsets.only(top: 4, left: 0, right: 0, bottom: 0),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              colorFromHex("#E6FFFA"),
              colorFromHex("#EBF4FF"),
            ])),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (isMobile)
                    const SizedBox(
                      height: 80,
                    ),
                  if (isMobile) StartMessage(titleStyle: titleStyle),
                  if (isMobile)
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      padding: EdgeInsets.zero,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/undraw_agreement_aajr.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  if (isDesktop)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 50),
                            child: Column(
                              children: [
                                StartMessage(titleStyle: titleStyle),
                                AppButton(
                                  text: "Kostenlos Registrieren",
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 50, top: 20),
                            child: const CircleAvatar(
                              radius: 150,
                              backgroundColor: Colors.white,
                              backgroundImage: ExactAssetImage(
                                  "assets/images/undraw_agreement_aajr.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (isMobile)
                    ClipPath(
                      clipper: CustomClipperPathCenter(),
                      child: Container(
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
                                          onValueChanged: (value) => setState(
                                              () => selectedIndex = value),
                                          children: cupertinoMap,
                                          padding: const EdgeInsets.all(0),
                                          groupValue: selectedIndex,
                                          selectedColor:
                                              colorFromHex("#81E6D9"),
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
                  if (isDesktop)
                    Stack(
                      children: [
                        ClipPath(
                          clipper: CustomClipperPathCenter(),
                          child: Container(
                            margin: const EdgeInsets.only(top: 0),
                            height: 780,
                            color: Colors.white,
                            child: Container(
                              margin: const EdgeInsets.only(top: 100, left: 10),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Row(
                                        children: [
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child:
                                                CupertinoSegmentedControl<int>(
                                              onValueChanged: (value) =>
                                                  setState(() =>
                                                      selectedIndex = value),
                                              children: cupertinoMap,
                                              padding: const EdgeInsets.all(0),
                                              groupValue: selectedIndex,
                                              selectedColor:
                                                  colorFromHex("#81E6D9"),
                                              pressedColor:
                                                  colorFromHex("#E6FFFA"),
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
                        Positioned(
                          left: 340,
                          right: 660,
                          top: 480,
                          child: SizedBox(
                            child: Image.asset("assets/images/Gruppe-1821.png"),
                          ),
                        ),
                      ],
                    ),
                  if (isMobile)
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 0, left: 40),
                                child: const LargeText(
                                  text: "2.",
                                )),
                            if (selectedIndex == 0)
                              Container(
                                margin: const EdgeInsets.only(top: 80),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const ContentText(
                                      text: "Erstellen dein Lebenslauf",
                                    ),
                                    if (selectedIndex == 1)
                                      const ContentText(
                                          text: "Erstellen ein Jobinserat"),
                                    Container(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Image.asset(
                                          "assets/images/undraw_task_31wc.png"),
                                    ),
                                  ],
                                ),
                              ),
                            if (selectedIndex == 1)
                              Container(
                                  margin: const EdgeInsets.only(top: 80),
                                  child: const ContentText(
                                      text: "Erstellen ein Jobinserat")),
                            if (selectedIndex == 2)
                              Container(
                                margin: const EdgeInsets.only(top: 60),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    ContentText(text: "Erhalte Vermittlungs-"),
                                    ContentText(
                                        text: "angebot von Arbeitgeber"),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        if (selectedIndex == 1)
                          Container(
                            margin: const EdgeInsets.only(bottom: 200),
                            child: Image.asset(
                                "assets/images/undraw_about_me_wa29.png"),
                          ),
                        if (selectedIndex == 2)
                          Container(
                            margin: const EdgeInsets.only(bottom: 200),
                            child: Image.asset(
                                "assets/images/undraw_job_offers_kw5d.png"),
                          ),
                      ],
                    ),
                  if (isDesktop)
                    Container(
                      padding: const EdgeInsets.only(right: 250, left: 250),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (selectedIndex == 0)
                                Container(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 100),
                                  child: Image.asset(
                                      "assets/images/undraw_task_31wc.png"),
                                ),
                              if (selectedIndex == 1)
                                Container(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 100),
                                  child: Image.asset(
                                      "assets/images/undraw_about_me_wa29.png"),
                                ),
                              if (selectedIndex == 2)
                                Container(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 100),
                                  child: Image.asset(
                                      "assets/images/undraw_job_offers_kw5d.png"),
                                ),
                              Row(
                                children: [
                                  const LargeText(
                                    text: "2.",
                                  ),
                                  if (selectedIndex == 0)
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 75, right: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const ContentText(
                                            text: "Erstellen dein Lebenslauf",
                                          ),
                                          if (selectedIndex == 1)
                                            const ContentText(
                                                text:
                                                    "Erstellen ein Jobinserat"),
                                        ],
                                      ),
                                    ),
                                  if (selectedIndex == 1)
                                    const ContentText(
                                        text: "Erstellen ein Jobinserat"),
                                  if (selectedIndex == 2)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        ContentText(
                                            text: "Erhalte Vermittlungs-"),
                                        ContentText(
                                            text: "angebot von Arbeitgeber"),
                                      ],
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  if (isMobile)
                    ClipPath(
                      clipper: CustomClipperPathBottom(),
                      child: Container(
                        margin: const EdgeInsets.only(top: 0, bottom: 100),
                        height: MediaQuery.of(context).size.height * 0.7,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 60),
                                    padding: const EdgeInsets.only(left: 80),
                                    child: const LargeText(
                                      text: '3.',
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin: const EdgeInsets.only(
                                        top: 120, left: 20),
                                    child: Column(
                                      children: [
                                        if (selectedIndex == 0)
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              ContentText(
                                                text: "Mit nur einem Klick",
                                              ),
                                              ContentText(
                                                text: "bewerben",
                                              )
                                            ],
                                          ),
                                        if (selectedIndex == 1)
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              ContentText(
                                                text: "Wähle deinen neuen",
                                              ),
                                              ContentText(
                                                text: "Mitarbeiter aus",
                                              )
                                            ],
                                          ),
                                        if (selectedIndex == 2)
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              ContentText(
                                                text: "Vermittlung nach",
                                              ),
                                              ContentText(
                                                text: "Provision oder",
                                              ),
                                              ContentText(
                                                text: "Stundenlohn",
                                              )
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (selectedIndex == 0)
                              Container(
                                margin: const EdgeInsets.only(bottom: 180),
                                padding:
                                    const EdgeInsets.only(right: 50, left: 70),
                                child: Image.asset(
                                    "assets/images/undraw_personal_file_222m.png"),
                              ),
                            if (selectedIndex == 1)
                              Container(
                                margin: const EdgeInsets.only(bottom: 180),
                                padding:
                                    const EdgeInsets.only(right: 50, left: 70),
                                child: Image.asset(
                                    "assets/images/undraw_swipe_profiles1_i6mr.png"),
                              ),
                            if (selectedIndex == 2)
                              Container(
                                margin: const EdgeInsets.only(bottom: 180),
                                padding:
                                    const EdgeInsets.only(right: 50, left: 70),
                                child: Image.asset(
                                    "assets/images/undraw_business_deal_cpi9.png"),
                              ),
                          ],
                        ),
                      ),
                    ),
                  if (isDesktop)
                    Stack(
                      children: [
                        ClipPath(
                          clipper: CustomClipperPathBottom(),
                          child: Container(
                            margin: const EdgeInsets.only(top: 0),
                            height: MediaQuery.of(context).size.height * 0.6,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom:
                                    BorderSide(width: 10, color: Colors.white),
                              ),
                            ),
                            padding:
                                const EdgeInsets.only(right: 320, left: 320),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const LargeText(
                                            text: '3.',
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 250, left: 20),
                                            child: Column(
                                              children: [
                                                if (selectedIndex == 0)
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      ContentText(
                                                        text:
                                                            "Mit nur einem Klick",
                                                      ),
                                                      ContentText(
                                                        text: "bewerben",
                                                      )
                                                    ],
                                                  ),
                                                if (selectedIndex == 1)
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      ContentText(
                                                        text:
                                                            "Wähle deinen neuen",
                                                      ),
                                                      ContentText(
                                                        text: "Mitarbeiter aus",
                                                      )
                                                    ],
                                                  ),
                                                if (selectedIndex == 2)
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      ContentText(
                                                        text:
                                                            "Vermittlung nach",
                                                      ),
                                                      ContentText(
                                                        text: "Provision oder",
                                                      ),
                                                      ContentText(
                                                        text: "Stundenlohn",
                                                      )
                                                    ],
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      // djdjjd
                                      if (selectedIndex == 0)
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          // padding:
                                          // const EdgeInsets.only(right: 50, left: 70),
                                          child: Image.asset(
                                              "assets/images/undraw_personal_file_222m.png"),
                                        ),
                                      if (selectedIndex == 1)
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          child: Image.asset(
                                              "assets/images/undraw_swipe_profiles1_i6mr.png"),
                                        ),
                                      if (selectedIndex == 2)
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          child: Image.asset(
                                              "assets/images/undraw_business_deal_cpi9.png"),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: SizedBox(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                color: Colors.white,
                                child: Container(),
                              )),
                        ),
                        Positioned(
                          left: 450,
                          right: 550,
                          bottom: 330,
                          child: SizedBox(
                            // height: 180,
                            child: Image.asset("assets/images/Gruppe-1822.png"),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
        if (isMobile)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: bottomNavigationBar(),
          ),
      ]),
    );
  }
}
