import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CauseWidget extends StatefulWidget {
  const CauseWidget({super.key});

  @override
  State<CauseWidget> createState() => _CauseWidgetState();
}

class _CauseWidgetState extends State<CauseWidget> {
  List<Map<String?, String?>> causeImgAndText = [
    {
      "img": "images/ngoprofilepics/udhaar/udhaar_1.jpeg",
      "causeText":
          "we have turned out widely for in excess of 500 Students to connect and restore understudies from the oppressed section. ",
    },
    {
      "img": "images/ngoprofilepics/udhaar/udhaar_2.jpeg",
      "causeText":
          "We do this through very much arranged and far reaching programs in wellbeing, schooling, recovery, restorative.",
    },
    {
      "img": "images/ngoprofilepics/udhaar/udhaar_3.jpeg",
      "causeText":
          "Udaar is highly inspired with various national and international philosophers , thinkers and great personalities.",
    },
    {
      "img": "images/ngoprofilepics/udhaar/udhaar_4.jpeg",
      "causeText":
          "We are an association that causes the ghettos to take care their schooling people understand their expectations.",
    },
  ];

  late List<Widget> widgetList = [
    ngoStoriesWidget(
      causeImgAndText[0]["img"],
      causeImgAndText[0]["causeText"],
    ),
    ngoStoriesWidget(
      causeImgAndText[1]["img"],
      causeImgAndText[1]["causeText"],
    ),
    ngoStoriesWidget(
      causeImgAndText[2]["img"],
      causeImgAndText[2]["causeText"],
    ),
    ngoStoriesWidget(
      causeImgAndText[3]["img"],
      causeImgAndText[3]["causeText"],
    ),
  ];

  int currentIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(2, 4, 0, 4),
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.98,
          child: CarouselSlider(
            items: widgetList,
            options: CarouselOptions(
              autoPlay: false,
              scrollDirection: Axis.horizontal,
              reverse: false,
              aspectRatio: 1.8,
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
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: DotsIndicator(
            dotsCount: widgetList.length,
            position: currentIdx.toDouble(),
            decorator: DotsDecorator(
              color: Colors.grey,
              activeColor: Colors.black,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        ),
      ],
    );
  }
}

ListView ngoStoriesWidget(String? img, String? cause) {
  return ListView(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: [
      NGOPhotoAreaForCause(img: img),
      NGOCauseTexts(
        cause: cause,
      ),
    ],
  );
}

class NGOPhotoAreaForCause extends StatelessWidget {
  final String? img;
  const NGOPhotoAreaForCause({super.key, this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.98,
      margin: const EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: ngoCausePhoto(img),
    );
  }
}

ClipRRect ngoCausePhoto(String? img) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(10), child: Image.asset(img!));
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
  const NGOBioTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      width: MediaQuery.of(context).size.width * 0.9,
      child: ngoBioText(),
    );
  }
}

Widget ngoBioText() {
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
    '''Udaar Foundation Non Government organisation (NGO) established on 16 Aug 2020 by Rishikant Mishra and his team. The committed organizers never realized that they would be effectively running a set up NGO, 'Udaar Foundation' spread across UP states. Udaar Foundation trusts and engages in giving all the assets to the penniless to help them so that they can make their own predetermination. We established this NGO due to the need of offering a chance to help the helpless kids, individuals and youth of India. We aim to diminish the destitution in India. Throughout the recent 2 years, Udaar Foundation has dealt with numerous tasks identified with mindfulness crusades like - Seminars on feminine wellbeing, women strengthening, sports, and women business venture which points toward aiding the oppressed part of the country. We have consistently believed that through development and grassroot endeavors, our youngsters can change this nation. Regardless of whether rich or poor, the cutting edge has the ability to change this world. The wide range of our exercises and their prosperity rate talk about committed work done by Udaar Foundation  ''',
  );
}
