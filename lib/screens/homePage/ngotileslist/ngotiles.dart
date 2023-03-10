import 'dart:convert';

import 'package:betterheroapp/model/ngomodel/ngomodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class NGOTilesListWidget extends StatefulWidget {
  const NGOTilesListWidget({super.key});

  @override
  State<NGOTilesListWidget> createState() => _NGOTilesListWidgetState();
}

class _NGOTilesListWidgetState extends State<NGOTilesListWidget> {
  List<dynamic> list = [];

  Future getNgoData() async {
    final String x = await rootBundle.loadString('images/data.json');
    final List data = await json.decode(x)['ngoData'];

    setState(() {
      list = data;
    });
  }

  @override
  void initState() {
    getNgoData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8),
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return NGOTileWidget(
          ngoName: list[index]['ngoName'],
          ngoCauses: list[index]['ngoCauses'],
          ngoRating: list[index]['ngoRating'],
          imgList: list[index]['ngoWorkingPhotos'],
          ngoBio: list[index]['ngoBio'],
          ngoLogoPic: list[index]['ngoLogoPhoto'],
          ngoTeamPhoto: list[index]['ngoTeamPhotos'][0],
        );
      },
    );
  }
}

class NGOTileWidget extends StatefulWidget {
  final String? ngoName;
  final String? ngoCauses;
  final String? ngoRating;
  final List<dynamic>? imgList;
  final String? ngoLogoPic;
  final String? ngoBio;
  final String? ngoTeamPhoto;

  const NGOTileWidget({
    super.key,
    required this.ngoName,
    required this.ngoCauses,
    required this.ngoRating,
    required this.imgList,
    this.ngoLogoPic,
    this.ngoBio,
    this.ngoTeamPhoto,
  });

  @override
  State<NGOTileWidget> createState() => _NGOTileWidgetState();
}

class _NGOTileWidgetState extends State<NGOTileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.imgList!.length);
        context.pushNamed(
          'ngoprofilePage',
          extra: widget.imgList,
          queryParams: {
            "ngoUID": "awdadwwad",
            "ngoName": widget.ngoName,
            "ngoCauses": widget.ngoCauses,
            "ngoRating": widget.ngoRating,
            "ngoLogoPhoto": widget.ngoLogoPic,
            "ngoBio": widget.ngoBio,
            "ngoTeamPhoto": widget.ngoTeamPhoto
          },
        );
      },
      child: Container(
        decoration: ngoTileWidgetDecoration(),
        margin: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.033,
            MediaQuery.of(context).size.height * 0.01,
            MediaQuery.of(context).size.width * 0.033,
            MediaQuery.of(context).size.height * 0.01),
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: [
            ngoTileBackImageAndLike(
                MediaQuery.of(context).size.height * 0.23, widget.imgList),
            ngoNameCauseAndRating(
                widget.ngoName, widget.ngoCauses, widget.ngoRating, context),
          ],
        ),
      ),
    );
  }
}

Container ngoTileBackImageAndLike(double height, List<dynamic>? imgList) {
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
          itemCount: imgList!.length,
          reverse: false,
          controller: _pageController,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              child: Image.network(
                imgList[index],
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
      color: Colors.grey.shade200);
}

Container ngoNameCauseAndRating(String? ngoName, String? ngoCause,
    String? ngorating, BuildContext context) {
  return Container(
    child: Row(
      children: [
        Expanded(child: ngoNameCause(ngoName, ngoCause, context)),
        ngoRating(ngorating, context),
      ],
    ),
  );
}

Container ngoNameCause(
    String? ngoName, String? ngoCause, BuildContext context) {
  return Container(
    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.03,
        MediaQuery.of(context).size.height * 0.01, 0, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$ngoName",
          style: ngoNameTextStyle(),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          ngoCause.toString(),
          overflow: TextOverflow.ellipsis,
          style: ngoCauseTextStyle(),
        )
      ],
    ),
  );
}

TextStyle ngoNameTextStyle() {
  return TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
}

TextStyle ngoCauseTextStyle() {
  return TextStyle(
    color: Colors.grey.shade600,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );
}

Container ngoRating(String? ngorating, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.orange.shade400,
      borderRadius: BorderRadius.circular(20),
    ),
    margin:
        EdgeInsets.fromLTRB(0, 0, MediaQuery.of(context).size.width * 0.033, 0),
    padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
    alignment: Alignment.topRight,
    child: Text(
      "${ngorating} ???",
      style: ratingTextStyle(),
    ),
  );
}

TextStyle ratingTextStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 16,
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
