import 'dart:math';

import 'package:betterheroapp/httprequests/ngodata.dart';
import 'package:betterheroapp/routes/dynamiclink.dart';
import 'package:betterheroapp/screens/ngoprofilepage/ngobio.dart';
import 'package:betterheroapp/screens/ngoprofilepage/ngoprofilescreens/screen1.dart';
import 'package:betterheroapp/screens/ngoprofilepage/ngoprofilescreens/screen2.dart';
import 'package:betterheroapp/screens/ngoprofilepage/overview.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import 'ngobackgroundandprofile.dart';
import 'ngoprofilescreens/screen3.dart';

class NGOProfileHomePage extends StatefulWidget {
  final String? ngoUID;

  const NGOProfileHomePage({
    super.key,
    required this.ngoUID,
  });

  @override
  State<NGOProfileHomePage> createState() => _NGOProfileHomePageState();
}

class _NGOProfileHomePageState extends State<NGOProfileHomePage> {
  static const List<Widget> _screenList = [
    Screen1(),
    Screen2(),
  ];
  int _currentIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentIdx = value;
          });
        },
        currentIndex: _currentIdx,
        backgroundColor: Colors.white,
        selectedFontSize: 15,
        unselectedFontSize: 12,
        selectedIconTheme: IconThemeData(color: Colors.orange),
        selectedItemColor: Colors.orange,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            label: "Info",
            icon: Icon(
              FontAwesomeIcons.handshake,
            ),
          ),
          BottomNavigationBarItem(
            label: "Updates",
            icon: Icon(
              Icons.update_sharp,
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(150, 50),
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(150, 50),
              backgroundColor: Colors.amber.shade500,
            ),
            child: Text(
              "Volunteer",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            onPressed: () {
              print("Donate Button");
            },
          )
        ],
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
        actions: [
          IconButton(
            onPressed: () {
              DynamicLinkProvider()
                  .createString('ngoprofile?ngoUID=${widget.ngoUID}')
                  .then(
                (value) {
                  Share.share(value);
                },
              );
            },
            icon: Icon(
              Icons.share,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: _screenList[_currentIdx],
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
