import 'package:betterheroapp/screens/homePage/ngotileslist/ngotiles.dart';
import 'package:betterheroapp/screens/profilepage/ngosupported.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      children: [
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print("Take it to the update section page");
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ngoTileBackImageAndLike(
                        MediaQuery.of(context).size.height * 0.23, []),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Date"),
                          Text("Total Raised"),
                          Text("Supporters"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
