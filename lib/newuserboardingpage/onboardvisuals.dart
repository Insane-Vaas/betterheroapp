import 'package:flutter/material.dart';

Widget widget1() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image(
        image: AssetImage(
          "images/searchngo.png",
        ),
      ),
      Text(
        "Search NGO",
        style: headingTextStyle(),
      ),
      Text(
        textAlign: TextAlign.center,
        "Explore NGOs of your preferred cause, location, their previous work and ratings.",
        style: paraTextStyle(),
      ),
    ],
  );
}

Widget widget2() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image(
        image: AssetImage(
          "images/donate.png",
        ),
      ),
      Text(
        "Support NGO",
        style: headingTextStyle(),
      ),
      Text(
        textAlign: TextAlign.center,
        "Donate the selected NGO or apply for any of their volunteering programs",
        style: paraTextStyle(),
      ),
    ],
  );
}

Widget widget3() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image(
        image: AssetImage(
          "images/helpothers.png",
        ),
      ),
      Text(
        "Get Updates",
        style: headingTextStyle(),
      ),
      Container(
        child: Text(
          textAlign: TextAlign.center,
          "The NGO after getting the support will give you regular updates on their work",
          style: paraTextStyle(),
        ),
      ),
    ],
  );
}

TextStyle headingTextStyle() {
  return TextStyle(
    color: Colors.black,
    fontSize: 26,
    fontWeight: FontWeight.w700,
  );
}

TextStyle paraTextStyle() {
  return TextStyle(
    color: Colors.black,
    fontSize: 17,
  );
}
