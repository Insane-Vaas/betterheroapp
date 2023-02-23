import 'package:betterheroapp/database/sqldatabase.dart';
import 'package:betterheroapp/screens/searchpage/recentsearches.dart';
import 'package:betterheroapp/screens/searchpage/searchresults.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../model/serachmodel/recentsearchmodel.dart';

class SearchPage extends StatefulWidget {
  final String? searchResult;
  const SearchPage({
    Key? key,
    this.searchResult,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<RecentSearch> list = [];
  Future getResults() async {
    List<RecentSearch> searchList = await DBProvider.db.getRecentSearch();
    setState(() {
      list = (searchList == null) ? [] : searchList;
    });
  }

  @override
  void initState() {
    getResults();
    print(widget.searchResult);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          SearchTextFieldWidget(),
          widget.searchResult == null
              ? RecentSearchListWidget(recentSearch: list)
              : SearchResultsWidget(
                  searchText: widget.searchResult,
                ),
        ],
      ),
    );
  }
}

class SearchTextFieldWidget extends StatelessWidget {
  SearchTextFieldWidget({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: MediaQuery.of(context).size.height * 0.07,
      width: 400,
      padding: EdgeInsets.all(5),
      child: Hero(
        tag: "search",
        child: Material(
          child: TextField(
            autofocus: true,
            controller: _textEditingController,
            cursorHeight: 22,
            style: TextStyle(
              fontSize: 25,
              height: 1.0,
              color: Colors.grey.shade800.withOpacity(0.85),
            ),
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {
                  context.goNamed('home');
                },
                icon: Icon(
                  CupertinoIcons.back,
                  color: Colors.green.shade400,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  if (_textEditingController.text == "") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Enter Something to search"),
                      ),
                    );
                  } else {
                    DBProvider.db.storeRecentSearch(
                      RecentSearch(
                        searchtext: _textEditingController.text,
                      ),
                    );
                    context.goNamed(
                      "searchpage",
                      queryParams: {
                        "searchText": _textEditingController.text,
                      },
                    );
                  }
                },
                icon: Icon(
                  CupertinoIcons.search,
                  color: Colors.green.shade400,
                ),
              ),
              enabledBorder: enabledBorder(),
              focusedBorder: focusedBorder(),
            ),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder enabledBorder() {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(20),
    ),
    borderSide: BorderSide(
      color: Colors.green.shade300.withOpacity(0.8),
      width: 2,
    ),
  );
}

OutlineInputBorder focusedBorder() {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(20),
    ),
    borderSide: BorderSide(
      color: Colors.green.shade400,
      width: 3,
    ),
  );
}
