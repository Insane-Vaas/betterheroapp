import 'dart:math';

import 'package:betterheroapp/httprequests/ngodata.dart';
import 'package:betterheroapp/routes/dynamiclink.dart';
import 'package:betterheroapp/screens/ngoprofilepage/ngobio.dart';
import 'package:betterheroapp/screens/ngoprofilepage/overview.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import 'ngobackgroundandprofile.dart';

class NGOProfileHomePage extends StatelessWidget {
  final String? ngoUID;

  const NGOProfileHomePage({
    super.key,
    required this.ngoUID,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          print(value);
        },
        currentIndex: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            label: "Screen 1",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Screen 2",
            icon: Icon(
              Icons.update_sharp,
            ),
          ),
          BottomNavigationBarItem(
            label: "Screen 3",
            icon: Icon(
              Icons.event,
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(120, 50),
          backgroundColor: Colors.amber.shade500,
        ),
        child: Text(
          "Donate",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        onPressed: () {
          print("Donate Button");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleTextStyle: appBarTextStyle(),
        titleSpacing: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "NGO Name",
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView(
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
                right: 2,
                child: Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade500.withOpacity(0.5),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.share_rounded,
                      size: 34,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    onPressed: () {
                      print("Some Stuff");
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: sqrt1_2,
                child: Container(
                  height: 80,
                  width: 80,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Text("Rating"),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Causes",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Wrap(
                  children: List<Widget>.generate(
                    growable: true,
                    4,
                    (index) => Container(
                      margin: EdgeInsets.all(8),
                      child: Chip(
                        avatar: Icon(Icons.help),
                        padding: EdgeInsets.all(9),
                        labelPadding: EdgeInsets.all(4),
                        label: Text(
                          "Causes",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
        ],
      ),
    );

    // FutureBuilder(
    //   future: GetNGOData().getNGOData(ngoUID.toString()),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Scaffold(
    //         backgroundColor: Colors.white,
    //         body: Center(
    //           child: CircularProgressIndicator(),
    //         ),
    //       );
    //     } else {
    //       return
    //     }
    //   },
    // );
  }
}

TextStyle appBarTextStyle() {
  return TextStyle(
    color: Colors.black,
    fontSize: 21,
    fontWeight: FontWeight.w600,
  );
}

Widget volunteerText() {
  return Container(
    margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
    child: Text(
      "Volunteer",
      style: aboutNGOTextStyle(),
    ),
  );
}

Widget eventText() {
  return Container(
    margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
    child: Text(
      "Events",
      style: aboutNGOTextStyle(),
    ),
  );
}

Widget aboutNGOText() {
  return Container(
    margin: EdgeInsets.fromLTRB(20, 4, 10, 4),
    child: Text(
      "About NGO",
      style: aboutNGOTextStyle(),
    ),
  );
}

TextStyle aboutNGOTextStyle() {
  return TextStyle(
    color: Colors.black,
    fontSize: 25,
    fontWeight: FontWeight.w600,
  );
}

Widget ngoNameText(String? ngoName, BuildContext context) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.fromLTRB(
      MediaQuery.of(context).size.width * 0.08,
      MediaQuery.of(context).size.height * 0.01,
      MediaQuery.of(context).size.width * 0.08,
      MediaQuery.of(context).size.height * 0.01,
    ),
    child: Text(
      ngoName.toString(),
      style: ngoNameTextStyle(),
      textAlign: TextAlign.center,
    ),
  );
}

TextStyle ngoNameTextStyle() {
  return TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
}

Widget rating(String? ngoRating) {
  return Container(
    alignment: Alignment.center,
    child: Text(
      "${ngoRating.toString()} ⭐️",
      style: ngoRatingTextStyle(),
      textAlign: TextAlign.center,
    ),
  );
}

TextStyle ngoRatingTextStyle() {
  return TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
}

Widget ngoCause(String? ngoCauses, BuildContext context) {
  return Container(
    margin: EdgeInsets.fromLTRB(
      MediaQuery.of(context).size.width * 0.05,
      MediaQuery.of(context).size.height * 0.01,
      MediaQuery.of(context).size.width * 0.05,
      MediaQuery.of(context).size.height * 0.01,
    ),
    alignment: Alignment.center,
    child: Text(
      ngoCauses.toString(),
      style: ngoCauseTextStyle(),
      textAlign: TextAlign.left,
    ),
  );
}

TextStyle ngoCauseTextStyle() {
  return TextStyle(
    color: Colors.grey.shade800,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
}
