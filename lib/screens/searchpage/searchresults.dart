import 'package:betterheroapp/httprequests/ngolist.dart';
import 'package:betterheroapp/screens/searchpage/searchpage.dart';
import 'package:flutter/material.dart';

import '../homePage/ngotileslist/ngotiles.dart';

class SearchResultsWidget extends StatefulWidget {
  final String? searchText;
  const SearchResultsWidget({super.key, required this.searchText});

  @override
  State<SearchResultsWidget> createState() => _SearchResultsWidgetState();
}

class _SearchResultsWidgetState extends State<SearchResultsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SearchTextFieldWidget(),
        Container(
          margin: EdgeInsets.fromLTRB(10, 4, 10, 4),
          child: Text(
            'Search Result for "${widget.searchText}"',
            style: searchResultTextStyle(),
          ),
        ),
        FutureBuilder(
          future: GetNGOList().getSearchNGOList(widget.searchText.toString()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                padding: EdgeInsets.all(8),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return NGOTileWidget(
                    ngoUID: snapshot.data![index]['_id'],
                    ngoName: snapshot.data![index]['ngoName'],
                    ngoCauses: snapshot.data![index]['ngoCauses'],
                    ngoRating: snapshot.data![index]['ngoRating'],
                    imgList: snapshot.data![index]['ngoWorkingPhotos'],
                  );
                },
              );
            }
          },
        ),
      ],
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
