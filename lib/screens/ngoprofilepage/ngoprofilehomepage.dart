import 'package:betterheroapp/routes/dynamiclink.dart';
import 'package:betterheroapp/screens/ngoprofilepage/ngobio.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import 'ngobackgroundandprofile.dart';

class NGOProfileHomePage extends StatelessWidget {
  final String? ngoUID;

  const NGOProfileHomePage({
    super.key,
    this.ngoUID,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        dividerColor: Colors.transparent,
      ),
      child: Scaffold(
        persistentFooterButtons: [
          Container(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                fixedSize: Size(150, 60),
                shape: StadiumBorder(),
              ),
              onPressed: () {
                context.goNamed('donationpage');
              },
              child: Text(
                "Donate",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          )
        ],
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          title: Text(
            "Udhaar Foundation",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  DynamicLinkProvider().createString('ngoprofile').then(
                    (value) {
                      Share.share(value);
                    },
                  );
                },
                icon: Icon(
                  Icons.share,
                  color: Colors.black,
                ))
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
          children: [
            StackNGOProfileAndBackground(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            ngoNameText(),
            rating(),
            ngoCause(),
            NGOBioTexts(),
            aboutNGOText(),
            CauseWidget(),
            // volunteerText(),
            // VolunterProgramTilesWidget(),
            // eventText(),
            // EventsWidget(),
          ],
        ),
      ),
    );
  }
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

Widget ngoNameText() {
  return Container(
    alignment: Alignment.center,
    child: Text(
      "Udhaar Foundation",
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

Widget rating() {
  return Container(
    alignment: Alignment.center,
    child: Text(
      "4.3 ⭐️",
      style: ngoRatingTextStyle(),
      textAlign: TextAlign.center,
    ),
  );
}

TextStyle ngoRatingTextStyle() {
  return TextStyle(
    color: Colors.black,
    fontSize: 21,
    fontWeight: FontWeight.w400,
  );
}

Widget ngoCause() {
  return Container(
    alignment: Alignment.center,
    child: Text(
      "Child Education, Women Empowerment",
      style: ngoCauseTextStyle(),
      textAlign: TextAlign.center,
    ),
  );
}

TextStyle ngoCauseTextStyle() {
  return TextStyle(
    color: Colors.black,
    fontSize: 19,
    fontWeight: FontWeight.w400,
  );
}
