import 'dart:convert';

class RecentSearch {
  int? id;
  String? searchtext;
  RecentSearch({
    this.id,
    this.searchtext,
  });

  RecentSearch copyWith({
    int? id,
    String? searchtext,
  }) {
    return RecentSearch(
      id: id ?? this.id,
      searchtext: searchtext ?? this.searchtext,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'searchtext': searchtext,
    };
  }

  factory RecentSearch.fromMap(Map<String, dynamic> map) {
    return RecentSearch(
      id: map['id'],
      searchtext: map['searchtext'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RecentSearch.fromJson(String source) =>
      RecentSearch.fromMap(json.decode(source));

  @override
  String toString() => 'RecentSearch(id: $id, searchtext: $searchtext)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecentSearch &&
        other.id == id &&
        other.searchtext == searchtext;
  }

  @override
  int get hashCode => id.hashCode ^ searchtext.hashCode;
}
