import 'package:betterheroapp/httprequests/ngodata.dart';
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
    required this.ngoUID,
  });

  @override
  Widget build(BuildContext context) {
    print(ngoUID);
    return FutureBuilder(
      future: GetNGOData().getNGOData(ngoUID.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            floatingActionButton: Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade400,
                  fixedSize: Size(150, 50),
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
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            backgroundColor: Colors.grey.shade100,
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              title: Text(
                snapshot.data!["ngoName"],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      DynamicLinkProvider()
                          .createString('ngoprofile?ngoUID=$ngoUID')
                          .then(
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
              backgroundColor: Colors.grey.shade100,
              elevation: 0,
            ),
            body: ListView(
              children: [
                StackNGOProfileAndBackground(
                    bgPic: snapshot.data!["ngoTeamPhotos"][0],
                    logoPic: snapshot.data!["ngoLogoPhoto"]),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                ngoNameText(snapshot.data!["ngoName"], context),
                rating(snapshot.data!["ngoRating"]),
                ngoCause(snapshot.data!["ngoCauses"], context),
                NGOBioTexts(ngoBio: snapshot.data!["ngoBio"]),
                // aboutNGOText(),
                CauseWidget(
                    ngoWorkingPhotos: snapshot.data!["ngoWorkingPhotos"]),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                // volunteerText(),
                // VolunterProgramTilesWidget(),
                // eventText(),
                // EventsWidget(),
              ],
            ),
          );
        }
      },
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
