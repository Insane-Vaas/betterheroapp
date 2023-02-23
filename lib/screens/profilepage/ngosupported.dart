import 'package:flutter/material.dart';

class NGOSupportedByUser extends StatefulWidget {
  const NGOSupportedByUser({super.key});

  @override
  State<NGOSupportedByUser> createState() => _NGOSupportedByUserState();
}

class _NGOSupportedByUserState extends State<NGOSupportedByUser> {
  List<Map<String, String>> list = [
    {
      "ngoName": "Udhaar Foundation",
      "ngoLogo": "images/ngoprofilepics/udhaar/udhaar_lg.jpg",
    },
    {
      "ngoName": "Jag Kalyan",
      "ngoLogo": "images/ngoprofilepics/jagkalyanlogo.png",
    },
    {
      "ngoName": "One Hand For Happiness",
      "ngoLogo": "images/ngoprofilepics/onehandforhappinesslogo.png",
    },
    {
      "ngoName": "Upasna",
      "ngoLogo": "images/ngoprofilepics/upasnalogo.jpg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      physics: const ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1, crossAxisCount: 3, mainAxisSpacing: 40),
      itemBuilder: (context, index) {
        return ngoWidgetTile(list[index]);
      },
    );
  }
}

Container ngoSupportedText() {
  return Container(
    margin: const EdgeInsets.fromLTRB(10, 8, 4, 8),
    alignment: Alignment.centerLeft,
    child: Text(
      "NGO Supported",
      style: ngoSupportedTextStyle(),
    ),
  );
}

TextStyle ngoSupportedTextStyle() {
  return TextStyle(
    color: Colors.black,
    fontSize: 26,
    fontWeight: FontWeight.w700,
  );
}

Widget ngoWidgetTile(Map<String, String> map) {
  return Container(
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ngoBackgroundImageWidget(map['ngoLogo']!),
        ngoNameWidget(map['ngoName']!),
      ],
    ),
    margin: const EdgeInsets.all(4),
  );
}

Widget ngoBackgroundImageWidget(String ngoLogo) {
  return CircleAvatar(
    radius: 40,
    backgroundImage: AssetImage(
      ngoLogo,
    ),
  );
}

Widget ngoNameWidget(String ngoName) {
  return Text(
    ngoName,
    style: ngoNameWigetTextStyle(),
    textAlign: TextAlign.center,
  );
}

TextStyle ngoNameWigetTextStyle() {
  return TextStyle(
    color: Colors.grey.shade700.withOpacity(0.8),
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
}
