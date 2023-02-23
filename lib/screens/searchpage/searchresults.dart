import 'package:flutter/material.dart';

class SearchResultsWidget extends StatelessWidget {
  final String? searchText;
  const SearchResultsWidget({super.key, required this.searchText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: Text(
        'Search Result for "${searchText}"',
        style: searchResultTextStyle(),
      ),
    );
  }
}

TextStyle searchResultTextStyle() {
  return TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
