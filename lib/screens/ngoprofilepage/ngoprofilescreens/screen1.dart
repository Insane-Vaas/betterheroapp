import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://github.com/Insane-Vaas/randompics/blob/main/udhaar_bg.jpg?raw=true",
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: sqrt1_2,
              child: GestureDetector(
                onTap: () {
                  print("Take it to the new review Page");
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 2, 4, 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: 80,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: Colors.green,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "4.3",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Icon(
                              CupertinoIcons.star_fill,
                              size: 18,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      Text("500+"),
                      Text("Reviews")
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
            10,
            4,
            10,
            10,
          ),
          child: Text(
            "Causes",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
            10,
            4,
            10,
            10,
          ),
          child: Wrap(
            children: List<Widget>.generate(
              growable: true,
              4,
              (index) => Container(
                margin: EdgeInsets.fromLTRB(
                  0,
                  5,
                  10,
                  5,
                ),
                child: Chip(
                  avatar: Icon(
                    FontAwesomeIcons.dog,
                    size: 15,
                  ),
                  padding: EdgeInsets.all(9),
                  labelPadding: EdgeInsets.all(4),
                  label: Text(
                    "Causes",
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
            10,
            4,
            10,
            10,
          ),
          child: Text(
            "Bio",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.black,
          height: MediaQuery.of(context).size.height * 0.22,
          child: Text(
            "Bio Text goes here",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        )
      ],
    );
  }
}
