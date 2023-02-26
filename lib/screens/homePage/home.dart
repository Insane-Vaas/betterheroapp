import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:betterheroapp/screens/homePage/donationicontile/donationiconwidget.dart';
import 'package:betterheroapp/screens/homePage/ngotileslist/ngotiles.dart';
import 'package:betterheroapp/screens/homePage/sortwidget/sortwidget.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String location = "";

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      setState(() {
        location = placemarks[0].locality.toString();
      });
    } catch (e) {
      print(e);
    }
  }

  String profilePic = "";
  String name = "";

  Future getProfilePic() async {
    String? picAdd = await FirebaseAuth.instance.currentUser!.photoURL;
    String? userName = await FirebaseAuth.instance.currentUser!.displayName;

    setState(() {
      if (picAdd != null) {
        profilePic = picAdd.toString();
        name = userName.toString();
      } else
        profilePic = "";
    });
  }

  @override
  void initState() {
    getLocation();
    getProfilePic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: customScrollView(location, name, profilePic, context),
    );
  }
}

CustomScrollView customScrollView(
    String location, String name, String profilePic, BuildContext context) {
  return CustomScrollView(
    physics: const ClampingScrollPhysics(),
    slivers: [
      AppBarWidget(
        location: location,
        name: name,
        profilePic: profilePic,
      ),
      SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 1.h, 0, 0),
          child: Row(
            children: [
              SizedBox(
                width: 31.w,
                child: Divider(
                  color: Colors.orange.shade400,
                  thickness: 0.2.h,
                ),
              ),
              Text(
                "Causes",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 31.w,
                child: Divider(
                  thickness: 0.2.h,
                  color: Colors.orange.shade400,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          // ),
        ),
      ),
      SliverToBoxAdapter(
        child: DonationIconWidget(),
      ),
      SliverToBoxAdapter(
        child: Center(
          // child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 20.w,
                child: Divider(
                  color: Colors.orange.shade400,
                  thickness: 0.2.h,
                ),
              ),
              Text(
                "Recommended NGOs",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 20.w,
                child: Divider(
                  thickness: 0.2.h,
                  color: Colors.orange.shade400,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          // ),
        ),
      ),
      SliverToBoxAdapter(
        child: NGOTilesListWidget(),
      ),
    ],
  );
}

// floatHeaderSlivers: true,
// headerSliverBuilder: (context, innerBoxIsScrolled) {
//   return [
//     appBar(location, innerBoxIsScrolled),
//   ];
// },
// body: Scaffold(
//   backgroundColor: Colors.white,
//   body: ListView(
//     physics: const ClampingScrollPhysics(),
//     padding: EdgeInsets.all(2),
//     shrinkWrap: true,
//     children: const [
//       DonationIconWidget(),
//     ],
//   ),
// ),

class AppBarWidget extends StatelessWidget {
  final String location;
  final String name;
  final String profilePic;

  const AppBarWidget({
    super.key,
    required this.location,
    required this.name,
    required this.profilePic,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      title: title(location, name, context),
      backgroundColor: Colors.grey.shade100,
      actions: [
        SearchArea(),
        ProfilePic(
          profilePic: profilePic,
          name: name,
        ),
      ],
      pinned: false,
      floating: true,
      centerTitle: false,
    );
  }
}

class ProfilePic extends StatelessWidget {
  final String profilePic;
  final String name;
  const ProfilePic({super.key, required this.profilePic, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          "profilePage",
          queryParams: {
            "profilePic": profilePic,
            "name": name,
          },
        );
      },
      child: profilePic == ""
          ? Hero(
              tag: 'profilepicture',
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 4.w, 0, 1.w),
                width: 18.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('images/profilepic.png'),
                  ),
                ),
              ),
            )
          : Hero(
              tag: 'profilepicture',
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 4.w, 0, 1.w),
                width: 18.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      profilePic,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

Widget title(String location, String name, BuildContext context) {
  return Container(
    margin: EdgeInsets.fromLTRB(1.5.w, 1.5.h, 0, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          name != "" ? "Hi, $name" : "Hi, Guest",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.dp,
          ),
          textScaleFactor: 1,
        ),
        Text(
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 10.dp,
          ),
          location,
        ),
      ],
    ),
  );
}

class SearchArea extends StatelessWidget {
  SearchArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final ScrollController controller = ScrollController();
    return Hero(
      tag: "search",
      child: GestureDetector(
        onTap: () {
          context.pushNamed('searchpage');
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 1.3.h, 0, 0),
          height: 3.h,
          width: 50.w,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                25,
              ),
              border: Border.all(
                color: Colors.orange.shade400,
                width: 0.1.h,
              )),
          alignment: Alignment.centerLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.search,
                color: Colors.orange.shade400,
                size: 25,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height * 0.0512,
                width: 34.w,
                child: Row(
                  children: <Widget>[
                    const Text(
                      'Search for ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('NGOs...',
                            speed: Duration(milliseconds: 90),
                            textStyle: TextStyle(color: Colors.grey.shade800)),
                        TypewriterAnimatedText('causes...',
                            speed: Duration(milliseconds: 90),
                            textStyle: TextStyle(color: Colors.grey.shade800)),
                        TypewriterAnimatedText('heroes...',
                            speed: Duration(milliseconds: 90),
                            textStyle: TextStyle(color: Colors.grey.shade800)),
                      ],
                      onTap: () {
                        context.pushNamed('searchpage');
                      },
                      repeatForever: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder enabledBorder() {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(20),
    ),
    borderSide: BorderSide(
      color: Colors.green.shade300.withOpacity(0.8),
      width: 2,
    ),
  );
}

OutlineInputBorder focusedBorder() {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(20),
    ),
    borderSide: BorderSide(
      color: Colors.green.shade400,
      width: 3,
    ),
  );
}


// ListView.builder(
//                   controller: controller,
//                   padding: EdgeInsets.zero,
//                   reverse: true,
//                   scrollDirection: Axis.vertical,
//                   shrinkWrap: true,
//                   itemCount: 5,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     if (controller.hasClients) {
//                       // Future.delayed(
//                       //   Duration(
//                       //     seconds: 2,
//                       //   ),
//                       //   () {
//                       //     if (index >= 0) {
//                       //       controller.animateTo(
//                       //           controller.position.maxScrollExtent,
//                       //           duration: Duration(seconds: 10),
//                       //           curve: Curves.ease);
//                       //       index = index + 1;
//                       //     } else if (index < 5) {
//                       //       controller.animateTo(
//                       //           controller.position.minScrollExtent,
//                       //           duration: Duration(seconds: 2),
//                       //           curve: Curves.ease);
//                       //       index = index - 1;
//                       //     }
//                       //   },
//                       // );
//                     }
//                     return Container(
//                       alignment: Alignment.centerLeft,
//                       height: height * 0.039,
//                       child: Text(
//                         '''Search "Something"''',
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.grey.shade600.withOpacity(0.9),
//                         ),
//                       ),
//                     );
//                   },
//                 ),