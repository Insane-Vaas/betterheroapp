import 'package:flutter/material.dart';

class NGOSupportedByUser extends StatefulWidget {
  const NGOSupportedByUser({super.key});

  @override
  State<NGOSupportedByUser> createState() => _NGOSupportedByUserState();
}

class _NGOSupportedByUserState extends State<NGOSupportedByUser> {
  List<Map<String, String>> list = [
    {
      "ngoName": "Udaar Foundation",
      "ngoLogo":
          "https://github.com/Insane-Vaas/randompics/blob/main/udhaar_lg.jpg?raw=true",
    },
    {
      "ngoName": "ASHRAY SEWA SAMITI",
      "ngoLogo":
          "https://github.com/Insane-Vaas/randompics/blob/main/ASHRAY%20SEWA%20SAMITI/download.png?raw=true",
    },
    {
      "ngoName": "ROSNI SOCIETY",
      "ngoLogo":
          "https://scontent.fdel1-5.fna.fbcdn.net/v/t39.30808-6/308200046_393239723017287_5717676169692199196_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=7Ar_lU5t2kkAX-C0KKV&_nc_ht=scontent.fdel1-5.fna&oh=00_AfAAA3VF_RzXaFGvI_rGQvJekzcOXF9jeTwevz-f7l9BCw&oe=63FEFBD8",
    },
    {
      "ngoName": "Astha Kunj Society",
      "ngoLogo":
          "https://github.com/Insane-Vaas/randompics/blob/main/asthakunjsociety/jagkalyanlogo.png?raw=true",
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
    backgroundImage: NetworkImage(
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
