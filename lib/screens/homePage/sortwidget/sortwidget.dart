import 'package:flutter/material.dart';

class SortingAndFilterWidget extends StatelessWidget {
  const SortingAndFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listString = [
      "SortBy",
      "Rating",
      "Location",
      "Nearby",
    ];
    return Container(
      margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
      height: MediaQuery.of(context).size.height * 0.06,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: listString.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(4),
            child: GestureDetector(
              onTap: () {
                print("Something");
              },
              child: Chip(
                padding: EdgeInsets.all(2),
                label: Text(
                  "${listString[index]}",
                  style: sortingTextStyle(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

TextStyle sortingTextStyle() {
  return TextStyle(
    color: Colors.black,
    fontSize: 15,
  );
}
