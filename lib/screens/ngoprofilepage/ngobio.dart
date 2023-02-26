// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'dart:convert';

class CauseWidget extends StatefulWidget {
  List<dynamic>? ngoWorkingPhotos;
  CauseWidget({
    Key? key,
    this.ngoWorkingPhotos,
  }) : super(key: key);

  @override
  State<CauseWidget> createState() => _CauseWidgetState();
}

class _CauseWidgetState extends State<CauseWidget> {
  late List<Widget> widgetList = [];

  Future getWorkingPics() async {
    for (int i = 0; i < widget.ngoWorkingPhotos!.length; i++) {
      setState(() {
        widgetList.add(ngoStoriesWidget(widget.ngoWorkingPhotos![i], ""));
      });
    }
  }

  @override
  void initState() {
    getWorkingPics();
    super.initState();
  }

  int currentIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: CarouselSlider(
              items: widgetList,
              options: CarouselOptions(
                autoPlay: false,
                scrollDirection: Axis.horizontal,
                reverse: false,
                viewportFraction: 1,
                enlargeCenterPage: true,
                height: MediaQuery.of(context).size.height * .45,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIdx = index;
                  });
                },
              ),
            ),
          ),
          widgetList.length > 0
              ? Container(
                  // padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: DotsIndicator(
                    dotsCount: widgetList.length,
                    position: currentIdx.toDouble(),
                    decorator: DotsDecorator(
                      color: Colors.orange.shade400,
                      activeColor: Colors.orange.shade800,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

ListView ngoStoriesWidget(String? img, String? cause) {
  return ListView(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: createNgoStoriesWidgetChildren(img, cause),
  );
}

List<Widget> createNgoStoriesWidgetChildren(String? img, String? cause) {
  var retVal = new List<Widget>.empty(growable: true);
  if (img!.isNotEmpty) {
    retVal.add(NGOPhotoAreaForCause(img: img));
  }
  if (cause!.isNotEmpty) {
    retVal.add(NGOCauseTexts(cause: cause));
  }
  return retVal;
}

class NGOPhotoAreaForCause extends StatelessWidget {
  final String? img;
  const NGOPhotoAreaForCause({super.key, this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .45,
      width: MediaQuery.of(context).size.width * 0.98,
      margin: const EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: ngoCausePhoto(img),
    );
  }
}

ClipRRect ngoCausePhoto(String? img) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(10), child: Image.network(img!));
}

class NGOCauseTexts extends StatelessWidget {
  final String? cause;
  const NGOCauseTexts({super.key, this.cause});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      child: ngoCauseText(cause),
    );
  }
}

Widget ngoCauseText(String? cause) {
  return Text(
    cause!,
    textScaleFactor: 1.1,
    textAlign: TextAlign.center,
  );
}

class NGOBioTexts extends StatelessWidget {
  String? ngoBio;
  NGOBioTexts({
    Key? key,
    this.ngoBio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      width: MediaQuery.of(context).size.width * 0.9,
      child: ngoBioText(ngoBio),
    );
  }
}

Widget ngoBioText(String? ngoBio) {
  return ReadMoreText(
    moreStyle: TextStyle(
      color: Colors.blue,
    ),
    lessStyle: TextStyle(
      color: Colors.blue,
    ),
    textAlign: TextAlign.justify,
    trimLines: 2,
    textScaleFactor: 1.1,
    '''${ngoBio.toString()}''',
  );
}
