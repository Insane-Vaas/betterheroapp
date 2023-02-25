import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        margin: EdgeInsets.all(8),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: listIconTile.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(4),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "${listIconTile[index]["iconName"]}",
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "${listIconTile[index]["causeName"]}",
                      style: TextStyle(
                        fontSize: 15,
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
