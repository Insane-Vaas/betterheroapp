import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/serachmodel/recentsearchmodel.dart';

class DBProvider {
  DBProvider._privateContructor();
  static final DBProvider db = DBProvider._privateContructor();

  static Database? _database;
  Future<Database> get database async => _database ?? await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'projectHero.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );
  }

  Future onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE search(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      searchtext Text
    )
''');
  }

  Future<List<RecentSearch>> getRecentSearch() async {
    Database db = await database;
    var searches = await db.query(
      'search',
      distinct: true,
      orderBy: 'id DESC',
      columns: ["id", "searchtext"],
      limit: 10,
    );
    List<RecentSearch> recentSearchList = searches.isNotEmpty
        ? searches.map((e) => RecentSearch.fromMap(e)).toList()
        : [];
    for (int i = 0; i < recentSearchList.length; i++) {
      String str = recentSearchList[i].searchtext as String;
      str = str.toLowerCase();

      for (int j = 0; j < str.length; j++) {
        if (j == 0) {
          str = str.replaceRange(0, 1, str[j].toUpperCase());
        } else if (j > 0 && str[j - 1] == " ") {
          str = str.replaceRange(j, j + 1, str[j].toUpperCase());
        }
      }
      recentSearchList[i].searchtext = str;
    }

    return recentSearchList;
  }

  Future deleteRecentSearch(RecentSearch recentSearch) async {
    Database db = await database;

    await db.delete('search', where: 'id = ?', whereArgs: [recentSearch.id]);
  }

  Future storeRecentSearch(RecentSearch recentSearch) async {
    Database db = await database;
    var searches = await db.query(
      'search',
      orderBy: 'id',
      columns: ["id", "searchtext"],
    );
    String? str = recentSearch.searchtext;
    str = str?.toLowerCase();
    RecentSearch recSearch = RecentSearch(
      searchtext: str,
      id: searches.length + 1,
    );

    await db.insert('search', recSearch.toMap());
  }
}
