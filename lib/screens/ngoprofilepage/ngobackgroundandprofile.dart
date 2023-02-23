import 'package:flutter/material.dart';

class StackNGOProfileAndBackground extends StatelessWidget {
  const StackNGOProfileAndBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        ngobackgroundImage(MediaQuery.of(context).size.height * 0.225),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.15,
          child: ngoprofilePicWidget(),
        ),
      ],
    );
  }
}

Widget ngoprofilePicWidget() {
  return Container(
    height: 120,
    width: 120,
    decoration: ngoprofilePicDecoration(),
  );
}

BoxDecoration ngoprofilePicDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(100),
    image: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage(
        "images/ngoprofilepics/udhaar/udhaar_lg.jpg",
      ),
    ),
    border: Border.all(
      color: Colors.white,
      width: 8,
    ),
  );
}

Widget ngobackgroundImage(double h) {
  return Container(
    height: h,
    margin: const EdgeInsets.all(0),
    child: const Image(
      width: double.infinity,
      fit: BoxFit.cover,
      image: AssetImage(
        "images/ngoprofilepics/udhaar/udhaar_bg.jpg",
      ),
    ),
  );
}
