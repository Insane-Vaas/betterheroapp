import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class DonationIconWidget extends StatelessWidget {
  const DonationIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> listIconTile = [
      {
        "iconName": "images/animalcare.png",
        "causeName": "Animal Care",
      },
      {
        "iconName": "images/catastrophe.png",
        "causeName": "Catastrophe",
      },
      {
        "iconName": "images/ecology.png",
        "causeName": "Ecology",
      },
      {
        "iconName": "images/wheelchair.png",
        "causeName": "Disabled",
      },
      {
        "iconName": "images/grandparents.png",
        "causeName": "Old Age",
      },
      {
        "iconName": "images/women.png",
        "causeName": "Women",
      },
      {
        "iconName": "images/healthcare.png",
        "causeName": "Health Care",
      },
      {
        "iconName": "images/pencils.png",
        "causeName": "Education",
      }
    ];

    return Container(
        color: Colors.white,
        child: GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: listIconTile.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.fromLTRB(
                  0, MediaQuery.of(context).size.height * 0.005, 0, 0),
              height: MediaQuery.of(context).size.height * 0.01,
              child: GestureDetector(
                onTap: (() {
                  context.goNamed(
                    "searchpage",
                    queryParams: {
                      "searchText": listIconTile[index]["causeName"],
                    },
                  );
                }),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 14.w,
                      width: 14.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "${listIconTile[index]["iconName"]}",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${listIconTile[index]["causeName"]}",
                      style: TextStyle(
                        fontSize: 10.dp,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
