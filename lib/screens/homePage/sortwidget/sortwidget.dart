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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List<Widget>.generate(
          listString.length,
          (int idx) {
            return GestureDetector(
              onTap: () {
                print("Something");
              },
              child: Chip(
                backgroundColor: Colors.orange.shade400,
                label: Text(
                  "${listString[idx]}",
                  style: sortingTextStyle(),
                ),
              ),
            );
          },
        ).toList(),
      ),
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
    );
  }
}

TextStyle sortingTextStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
}
