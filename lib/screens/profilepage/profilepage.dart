import 'package:betterheroapp/screens/backbuttonforrouting.dart';
import 'package:betterheroapp/screens/homePage/home.dart';
import 'package:betterheroapp/screens/profilepage/ngosupported.dart';
import 'package:betterheroapp/screens/profilepage/userbasicinfo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'bacgroundpicandprofile.dart';

class UserProfilePage extends StatefulWidget {
  final String? userUID;
  final String? profilePic;

  const UserProfilePage({
    Key? key,
    this.userUID,
    this.profilePic,
  }) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(

        //   onPressed: () {},
        //   backgroundColor: Colors.white,
        //   child: Icon(
        //     Icons.share,
        //     size: 40,
        //     color: Colors.grey.shade800.withOpacity(
        //       0.8,
        //     ),
        //   ),
        // ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 32,
          ),
          elevation: 0,
          leading: BackButtonForRouting(
            routeName: 'home',
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            StackProfileAndBackground(profilePic: widget.profilePic.toString()),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            BasicUserInfo(),
            ngoSupportedText(),
            NGOSupportedByUser(),
          ],
        ),
      ),
    );
  }
}
