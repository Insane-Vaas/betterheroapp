import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:betterheroapp/newuserboardingpage/onboardvisuals.dart';

class NewUserOnBoardingPage extends StatefulWidget {
  SharedPreferences? sharedPreferences;
  NewUserOnBoardingPage({
    Key? key,
    this.sharedPreferences,
  }) : super(key: key);

  @override
  State<NewUserOnBoardingPage> createState() => _NewUserOnBoardingPageState();
}

class _NewUserOnBoardingPageState extends State<NewUserOnBoardingPage> {
  Future checkValue() async {
    bool? check = widget.sharedPreferences!.getBool('onboarding');

    if (check == true) {
      context.goNamed('home');
    }
  }

  Future setValue() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding', true);
  }

  @override
  void initState() {
    checkValue();
    super.initState();
  }

  PageController _pageController = PageController();
  double _currIdx = 0;

  List<Widget> pageWidgets = [
    widget1(),
    widget2(),
    widget3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Better Hero",
          style: titleTextStyle(),
        ),
        centerTitle: true,
        actions: [
          Container(
            decoration: skipWidgetDecoration(),
            alignment: Alignment.center,
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              onTap: (() {
                setValue();
                context.goNamed('home');
              }),
              child: Text(
                "Skip",
                style: skipTextStyle(),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
              alignment: Alignment.center,
              color: Colors.white,
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.65,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    _currIdx = value.toDouble();
                  });
                },
                controller: _pageController,
                itemCount: pageWidgets.length,
                itemBuilder: (context, index) {
                  return pageWidgets[index];
                },
              )),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: DotsIndicator(
              dotsCount: pageWidgets.length,
              position: _currIdx,
              decorator: DotsDecorator(
                color: Colors.grey,
                activeColor: Colors.black,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: ElevatedButton(
              style: elevatedButtonStyle(),
              child: _currIdx < 2
                  ? Text(
                      "Next",
                      style: buttonTextStyle(),
                    )
                  : Text(
                      "Let's Go",
                      style: buttonTextStyle(),
                    ),
              onPressed: () {
                setState(
                  () {
                    if (_currIdx < 2) {
                      _pageController.nextPage(
                        duration: Duration(
                          milliseconds: 700,
                        ),
                        curve: Curves.ease,
                      );
                    } else {
                      setValue();
                      context.goNamed('home');
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle buttonTextStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.w800,
  );
}

ButtonStyle elevatedButtonStyle() {
  return ElevatedButton.styleFrom(
    fixedSize: Size(150, 60),
    shape: StadiumBorder(),
    backgroundColor: Colors.orange.shade400,
  );
}

TextStyle titleTextStyle() {
  return TextStyle(
    color: Colors.orange.shade500,
    fontSize: 25,
    fontWeight: FontWeight.w600,
  );
}

BoxDecoration skipWidgetDecoration() {
  return BoxDecoration(
      color: Colors.grey.shade300.withOpacity(0.5),
      borderRadius: BorderRadius.circular(20));
}

TextStyle skipTextStyle() {
  return TextStyle(
    fontSize: 18,
    color: Colors.grey.shade900.withOpacity(0.85),
  );
}
