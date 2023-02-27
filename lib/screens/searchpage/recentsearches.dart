import 'package:betterheroapp/database/sqldatabase.dart';
import 'package:betterheroapp/model/serachmodel/recentsearchmodel.dart';
import 'package:betterheroapp/screens/searchpage/searchpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecentSearchListWidget extends StatefulWidget {
  const RecentSearchListWidget({
    super.key,
  });

  @override
  State<RecentSearchListWidget> createState() => _RecentSearchListWidgetState();
}

class _RecentSearchListWidgetState extends State<RecentSearchListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        SearchTextFieldWidget(),
        FutureBuilder(
          future: DBProvider.db.getRecentSearch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox();
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.goNamed(
                        "searchpage",
                        queryParams: {
                          "searchText":
                              snapshot.data![index].searchtext.toString(),
                        },
                      );
                    },
                    child: ListTile(
                      leading: Icon(CupertinoIcons.search),
                      title: Text(
                        snapshot.data![index].searchtext.toString(),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          DBProvider.db.deleteRecentSearch(
                            snapshot.data![index],
                          );
                          setState(() {
                            snapshot.data!.removeAt(index);
                          });
                        },
                        icon: Icon(CupertinoIcons.delete_simple),
                      ),
                    ),
                  );
                },
              );
            }
          },
        )
      ],
    );
  }
}
