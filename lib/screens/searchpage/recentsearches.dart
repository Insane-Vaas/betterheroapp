import 'package:betterheroapp/database/sqldatabase.dart';
import 'package:betterheroapp/model/serachmodel/recentsearchmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecentSearchListWidget extends StatefulWidget {
  final List<RecentSearch> recentSearch;
  const RecentSearchListWidget({super.key, required this.recentSearch});

  @override
  State<RecentSearchListWidget> createState() => _RecentSearchListWidgetState();
}

class _RecentSearchListWidgetState extends State<RecentSearchListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.recentSearch.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.goNamed(
              "searchpage",
              queryParams: {
                "searchText": widget.recentSearch[index].searchtext.toString(),
              },
            );
          },
          child: ListTile(
            leading: Icon(CupertinoIcons.search),
            title: Text(
              widget.recentSearch[index].searchtext.toString(),
            ),
            trailing: IconButton(
              onPressed: () {
                DBProvider.db.deleteRecentSearch(
                  widget.recentSearch[index],
                );
                setState(() {
                  widget.recentSearch.removeAt(index);
                });
              },
              icon: Icon(CupertinoIcons.delete_simple),
            ),
          ),
        );
      },
    );
  }
}
