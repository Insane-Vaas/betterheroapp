// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StackNGOProfileAndBackground extends StatelessWidget {
  final String? logoPic;
  final String? bgPic;
  const StackNGOProfileAndBackground({
    Key? key,
    required this.logoPic,
    required this.bgPic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        ngobackgroundImage(MediaQuery.of(context).size.height * 0.225, bgPic),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.15,
          child: ngoprofilePicWidget(logoPic),
        ),
      ],
    );
  }
}

Widget ngoprofilePicWidget(String? logoPic) {
  return Container(
    height: 120,
    width: 120,
    decoration: ngoprofilePicDecoration(logoPic),
  );
}

BoxDecoration ngoprofilePicDecoration(String? logoPic) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(100),
    image: DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage('$logoPic'),
    ),
    border: Border.all(
      color: Colors.white,
      width: 8,
    ),
  );
}

Widget ngobackgroundImage(double h, String? bgPic) {
  return Container(
    height: h,
    margin: const EdgeInsets.all(0),
    child: Image(
      width: double.infinity,
      fit: BoxFit.cover,
      image: NetworkImage('$bgPic'),
    ),
  );
}
