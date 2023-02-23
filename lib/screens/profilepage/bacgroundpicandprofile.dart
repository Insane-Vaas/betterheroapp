import 'package:flutter/material.dart';

class StackProfileAndBackground extends StatelessWidget {
  final String profilePic;
  const StackProfileAndBackground({super.key, required this.profilePic});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        backgroundImage(MediaQuery.of(context).size.height * 0.225),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.15,
          child: profilePicWidget(profilePic),
        ),
      ],
    );
  }
}

Widget profilePicWidget(String profilePic) {
  return Hero(
    tag: 'profilepicture',
    child: Container(
      height: 120,
      width: 120,
      decoration: profilePic != ""
          ? profilePicDecoration(profilePic)
          : BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 8,
              ),
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('images/profilepic.png'),
              ),
            ),
    ),
  );
}

BoxDecoration profilePicDecoration(String profilePic) {
  return BoxDecoration(
    shape: BoxShape.circle,
    image: DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage(
        profilePic,
      ),
    ),
    border: Border.all(
      color: Colors.white,
      width: 8,
    ),
  );
}

Widget backgroundImage(double h) {
  return Container(
    height: h,
    margin: const EdgeInsets.all(0),
    child: const Image(
      width: double.infinity,
      fit: BoxFit.cover,
      image: AssetImage(
        "images/background.jpeg",
      ),
    ),
  );
}
