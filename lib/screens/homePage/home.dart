import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:betterheroapp/screens/homePage/donationicontile/donationiconwidget.dart';
import 'package:betterheroapp/screens/homePage/ngotileslist/ngotiles.dart';
import 'package:betterheroapp/screens/homePage/sortwidget/sortwidget.dart';

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
      if (picAdd != null && name != null) {
        profilePic = picAdd.toString();
        name = userName.toString();
      } else
        profilePic = "";
    });
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: customScrollView(location, name, profilePic),
    );
  }
}

CustomScrollView customScrollView(
    String location, String name, String profilePic) {
  return CustomScrollView(
    physics: const ClampingScrollPhysics(),
    slivers: [
      AppBarWidget(
        location: location,
        name: name,
        profilePic: profilePic,
      ),
      SliverToBoxAdapter(
        child: DonationIconWidget(),
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
      title: title(location, name),
      backgroundColor: Colors.white,
      actions: [
        ProfilePic(profilePic: profilePic),
      ],
      pinned: true,
      floating: true,
      centerTitle: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.18,
      bottom: searchAndSortArea(
        MediaQuery.of(context).size.height,
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  final String profilePic;
  const ProfilePic({super.key, required this.profilePic});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          "profilePage",
          queryParams: {
            "profilePic": profilePic,
          },
        );
      },
      child: profilePic == ""
          ? Hero(
              tag: 'profilepicture',
              child: Container(
                width: MediaQuery.of(context).size.width * 0.18,
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
                width: MediaQuery.of(context).size.width * 0.18,
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

Widget title(String location, String name) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Hi, $name",
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
        textScaleFactor: 1,
      ),
      Text(
        style: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 15,
        ),
        location,
      ),
    ],
  );
}

PreferredSize searchAndSortArea(double height) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height * 0.12),
    child: Container(
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          SearchArea(height: height),
          SortingAndFilterWidget(),
        ],
      ),
    ),
  );
}

class SearchArea extends StatelessWidget {
  final double height;
  SearchArea({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "search",
      child: GestureDetector(
        onTap: () {
          context.pushNamed('searchpage');
        },
        child: Container(
          margin: const EdgeInsets.all(4),
          height: height * 0.0512,
          width: 400,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20,
              ),
              border: Border.all(
                color: Colors.green.shade400,
                width: 2,
              )),
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.search,
            color: Colors.green.shade500,
          ),

          //TextField(
          //   controller: _textEditingController,
          //   cursorHeight: 25,
          //   style: TextStyle(
          //     fontSize: 25,
          //     height: 1.0,
          //     color: Colors.grey.shade800.withOpacity(0.85),
          //   ),
          //   decoration: InputDecoration(
          //     prefixIcon: IconButton(
          //       onPressed: () {},
          //       icon: const Icon(Icons.search),
          //     ),
          //     enabledBorder: enabledBorder(),
          //     focusedBorder: focusedBorder(),
          //   ),
          // ),
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
