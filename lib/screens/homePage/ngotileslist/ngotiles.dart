import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NGOTilesListWidget extends StatefulWidget {
  const NGOTilesListWidget({super.key});

  @override
  State<NGOTilesListWidget> createState() => _NGOTilesListWidgetState();
}

class _NGOTilesListWidgetState extends State<NGOTilesListWidget> {
  List<Map<dynamic, dynamic>> list = [
    {
      "ngoName": "Udhar Foundation",
      "ngoCause": "Child Education, Women Emp...",
      "ngoRating": "4.3",
      "imgList": [
        "images/ngoprofilepics/udhaar/udhaar_1.jpeg",
        "images/ngoprofilepics/udhaar/udhaar_2.jpeg",
        "images/ngoprofilepics/udhaar/udhaar_3.jpeg",
        "images/ngoprofilepics/udhaar/udhaar_4.jpeg",
        "images/ngoprofilepics/udhaar/udhaar_5.jpeg",
      ],
    },
    {
      "ngoName": "One Hand For Happiness",
      "ngoCause": "Child Education",
      "ngoRating": "4.2",
      "imgList": [
        "images/ngoprofilepics/onehandforhappiness/one_hand_for_happiness_1.jpeg",
        "images/ngoprofilepics/onehandforhappiness/one_hand_for_happiness_2.jpeg",
        "images/ngoprofilepics/onehandforhappiness/one_hand_for_happiness_3.jpeg"
      ],
    },
    {
      "ngoName": "Save A Stray",
      "ngoCause": "Animal Care",
      "ngoRating": "4.1",
      "imgList": [
        "images/ngoprofilepics/saveastray/save_a_stray_1.jpeg",
        "images/ngoprofilepics/saveastray/save_a_stray_2.jpeg",
        "images/ngoprofilepics/saveastray/save_a_stray_3.jpeg"
      ],
    },
    {
      "ngoName": "Upasna",
      "ngoCause": "Specially Abled Kid",
      "ngoRating": "4.4",
      "imgList": [
        "images/ngoprofilepics/upasna/upasna_1.JPG",
        "images/ngoprofilepics/upasna/upasna_2.JPG",
        "images/ngoprofilepics/upasna/upasna_3.JPG",
        "images/ngoprofilepics/upasna/upasna_4.JPG"
      ],
    },
    {
      "ngoName": "Astha Kunj Society",
      "ngoCause": "Women Empowerment",
      "ngoRating": "4.2",
      "imgList": [
        "images/ngoprofilepics/asthakunjsociety/asthakunjsociety_3.jpg",
        "images/ngoprofilepics/asthakunjsociety/asthakunjsociety_2.jpg",
        "images/ngoprofilepics/asthakunjsociety/asthakunjsociety_1.jpg"
      ],
    },
  ];

  final List<Map<dynamic, dynamic>> ngoDataList = [
    {
      "ngoName": "Udhaar Foundation",
      "ngoBackground": "",
      "ngoLogo": "",
      "ngoRating": "",
      "ngoCauses": "",
      "ngoBio": "",
      "ngoImg": "",
      "ngoLines": "",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8),
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return NGOTileWidget(
          ngoName: list[index]["ngoName"],
          ngoCause: list[index]["ngoCause"],
          ngoRating: list[index]["ngoRating"],
          imgList: list[index]["imgList"],
        );
      },
    );
  }
}

class NGOTileWidget extends StatefulWidget {
  final String? ngoName;
  final String? ngoCause;
  final String? ngoRating;
  final List<dynamic> imgList;
  const NGOTileWidget({
    super.key,
    required this.ngoName,
    required this.ngoCause,
    required this.ngoRating,
    required this.imgList,
  });

  @override
  State<NGOTileWidget> createState() => _NGOTileWidgetState();
}

class _NGOTileWidgetState extends State<NGOTileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          'ngoprofilePage',
          queryParams: {
            "ngoUID": "awdadwwad",
          },
        );
      },
      child: Container(
        decoration: ngoTileWidgetDecoration(),
        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.02,
            15, MediaQuery.of(context).size.width * 0.02, 15),
        height: MediaQuery.of(context).size.height * 0.31,
        child: Column(
          children: [
            ngoTileBackImageAndLike(
                MediaQuery.of(context).size.height * 0.23, widget.imgList),
            ngoNameCauseAndRating(
              widget.ngoName,
              widget.ngoCause,
              widget.ngoRating,
            ),
          ],
        ),
      ),
    );
  }
}

Container ngoTileBackImageAndLike(double height, List<dynamic> imglist) {
  PageController _pageController = PageController();
  late bool liked = false;
  return Container(
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(18),
        topRight: Radius.circular(18),
      ),
    ),
    child: Stack(
      children: [
        PageView.builder(
          itemCount: imglist.length,
          //reverse: false,
          controller: _pageController,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              child: Image.asset(
                imglist[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        FavButton(liked: liked),
        Positioned(
          left: 0,
          height: height,
          child: GestureDetector(
            child: Container(
              margin: EdgeInsets.all(2),
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade800.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.grey.shade100,
                  size: 30,
                ),
              ),
            ),
            onTap: (() {
              _pageController.previousPage(
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            }),
          ),
        ),
        Positioned(
          right: 0,
          height: height,
          child: GestureDetector(
            child: Container(
              margin: EdgeInsets.all(2),
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade800.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey.shade100,
                  size: 30,
                ),
              ),
            ),
            onTap: (() {
              _pageController.nextPage(
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            }),
          ),
        ),
      ],
    ),
  );
}

BoxDecoration ngoTileWidgetDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(18),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade500,
        blurRadius: 5,
        offset: Offset(4, 4),
      ),
      BoxShadow(
        color: Colors.grey.shade300,
        blurRadius: 4,
        offset: Offset(-1, -1),
      ),
    ],
    color: Colors.white,
  );
}

Row ngoNameCauseAndRating(
    String? ngoName, String? ngoCause, String? ngorating) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ngoNameCause(
        ngoName,
        ngoCause,
      ),
      ngoRating(ngorating),
    ],
  );
}

Container ngoNameCause(String? ngoName, String? ngoCause) {
  return Container(
    margin: EdgeInsets.fromLTRB(8, 4, 20, 4),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(2),
          child: Text(
            "$ngoName",
            style: ngoNameTextStyle(),
          ),
        ),
        Container(
          margin: EdgeInsets.all(2),
          child: Text(
            "$ngoCause",
            style: ngoCauseTextStyle(),
          ),
        ),
      ],
    ),
  );
}

TextStyle ngoNameTextStyle() {
  return TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 21,
  );
}

TextStyle ngoCauseTextStyle() {
  return TextStyle(
    color: Colors.grey.shade600,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
}

Container ngoRating(String? ngorating) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(20),
    ),
    margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
    padding: EdgeInsets.all(2),
    alignment: Alignment.topRight,
    child: Text(
      "${ngorating} ⭑",
      style: ratingTextStyle(),
    ),
  );
}

TextStyle ratingTextStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
}

class FavButton extends StatefulWidget {
  late bool liked;
  FavButton({
    Key? key,
    required this.liked,
  }) : super(key: key);

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 5,
      top: 5,
      child: GestureDetector(
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
          ),
          child: !widget.liked
              ? Icon(
                  CupertinoIcons.heart,
                  color: Colors.orange.shade500,
                  size: 25,
                )
              : Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.orange.shade500,
                  size: 25,
                ),
        ),
        onTap: (() {
          setState(() {
            widget.liked = !widget.liked;
          });
        }),
      ),
    );
  }
}
