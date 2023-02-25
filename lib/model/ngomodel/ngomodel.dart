// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class NGOModel {
  String? ngoName;
  String? ngoRating;
  String? ngoCity;
  String? ngoState;
  String? ngoBio;
  String? ngoCauses;
  String? ngoOperationalArea;
  String? ngoLogoPhoto;
  List<String>? ngoWorkingPhotos;
  List<String>? ngoTeamPhotos;
  NGOModel({
    this.ngoName,
    this.ngoRating,
    this.ngoCity,
    this.ngoState,
    this.ngoBio,
    this.ngoCauses,
    this.ngoOperationalArea,
    this.ngoLogoPhoto,
    this.ngoWorkingPhotos,
    this.ngoTeamPhotos,
  });

  NGOModel copyWith({
    String? ngoName,
    String? ngoRating,
    String? ngoCity,
    String? ngoState,
    String? ngoBio,
    String? ngoCauses,
    String? ngoOperationalArea,
    String? ngoLogoPhoto,
    List<String>? ngoWorkingPhotos,
    List<String>? ngoTeamPhotos,
  }) {
    return NGOModel(
      ngoName: ngoName ?? this.ngoName,
      ngoRating: ngoRating ?? this.ngoRating,
      ngoCity: ngoCity ?? this.ngoCity,
      ngoState: ngoState ?? this.ngoState,
      ngoBio: ngoBio ?? this.ngoBio,
      ngoCauses: ngoCauses ?? this.ngoCauses,
      ngoOperationalArea: ngoOperationalArea ?? this.ngoOperationalArea,
      ngoLogoPhoto: ngoLogoPhoto ?? this.ngoLogoPhoto,
      ngoWorkingPhotos: ngoWorkingPhotos ?? this.ngoWorkingPhotos,
      ngoTeamPhotos: ngoTeamPhotos ?? this.ngoTeamPhotos,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ngoName': ngoName,
      'ngoRating': ngoRating,
      'ngoCity': ngoCity,
      'ngoState': ngoState,
      'ngoBio': ngoBio,
      'ngoCauses': ngoCauses,
      'ngoOperationalArea': ngoOperationalArea,
      'ngoLogoPhoto': ngoLogoPhoto,
      'ngoWorkingPhotos': ngoWorkingPhotos,
      'ngoTeamPhotos': ngoTeamPhotos,
    };
  }

  factory NGOModel.fromMap(Map<String, dynamic> map) {
    return NGOModel(
        ngoName: map['ngoName'] != null ? map['ngoName'] as String : null,
        ngoRating: map['ngoRating'] != null ? map['ngoRating'] as String : null,
        ngoCity: map['ngoCity'] != null ? map['ngoCity'] as String : null,
        ngoState: map['ngoState'] != null ? map['ngoState'] as String : null,
        ngoBio: map['ngoBio'] != null ? map['ngoBio'] as String : null,
        ngoCauses: map['ngoCauses'] != null ? map['ngoCauses'] as String : null,
        ngoOperationalArea: map['ngoOperationalArea'] != null
            ? map['ngoOperationalArea'] as String
            : null,
        ngoLogoPhoto:
            map['ngoLogoPhoto'] != null ? map['ngoLogoPhoto'] as String : null,
        ngoWorkingPhotos: map['ngoWorkingPhotos'] != null
            ? List<String>.from((map['ngoWorkingPhotos'] as List<String>))
            : null,
        ngoTeamPhotos: map['ngoTeamPhotos'] != null
            ? List<String>.from((map['ngoTeamPhotos'] as List<String>))
            : null);
  }

  String toJson() => json.encode(toMap());

  factory NGOModel.fromJson(String source) =>
      NGOModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NGOModel(ngoName: $ngoName, ngoRating: $ngoRating, ngoCity: $ngoCity, ngoState: $ngoState, ngoBio: $ngoBio, ngoCauses: $ngoCauses, ngoOperationalArea: $ngoOperationalArea, ngoLogoPhoto: $ngoLogoPhoto, ngoWorkingPhotos: $ngoWorkingPhotos, ngoTeamPhotos: $ngoTeamPhotos)';
  }

  @override
  bool operator ==(covariant NGOModel other) {
    if (identical(this, other)) return true;

    return other.ngoName == ngoName &&
        other.ngoRating == ngoRating &&
        other.ngoCity == ngoCity &&
        other.ngoState == ngoState &&
        other.ngoBio == ngoBio &&
        other.ngoCauses == ngoCauses &&
        other.ngoOperationalArea == ngoOperationalArea &&
        other.ngoLogoPhoto == ngoLogoPhoto &&
        listEquals(other.ngoWorkingPhotos, ngoWorkingPhotos) &&
        listEquals(other.ngoTeamPhotos, ngoTeamPhotos);
  }

  @override
  int get hashCode {
    return ngoName.hashCode ^
        ngoRating.hashCode ^
        ngoCity.hashCode ^
        ngoState.hashCode ^
        ngoBio.hashCode ^
        ngoCauses.hashCode ^
        ngoOperationalArea.hashCode ^
        ngoLogoPhoto.hashCode ^
        ngoWorkingPhotos.hashCode ^
        ngoTeamPhotos.hashCode;
  }
}
