import 'package:flutter/material.dart';

class BasicUserInfo extends StatelessWidget {
  const BasicUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        userName(),
        userBio(),
      ],
    );
  }
}

Container userName() {
  return Container(
    alignment: Alignment.center,
    child: Text(
      "Shubham Dharmsktu",
      style: userNameTextStyle(),
    ),
  );
}

Container userBio() {
  return Container(
    margin: EdgeInsets.fromLTRB(25, 8, 25, 8),
    alignment: Alignment.center,
    child: Text(
      textAlign: TextAlign.center,
      "Basic User info that he wants to share with other folks.",
      style: userBioTextStyle(),
    ),
  );
}

TextStyle userNameTextStyle() {
  return TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
}

TextStyle userBioTextStyle() {
  return TextStyle(
    color: Colors.grey.shade700.withOpacity(0.9),
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
}
