import 'dart:convert';

class NGOModel {
  String? ngoName;
  String? ngoDateofReg;
  String? ngoCity;
  String? ngoState;
  String? ngoBio;
  String? ngoCauses;
  String? ngoOperationalArea;
  String? ngoLogoPhoto;
  String? ngoWorkingPhotos;
  String? ngoTeamPhotos;
  String? ngoWorkingPhotoD;
  NGOModel({
    this.ngoName,
    this.ngoDateofReg,
    this.ngoCity,
    this.ngoState,
    this.ngoBio,
    this.ngoCauses,
    this.ngoOperationalArea,
    this.ngoLogoPhoto,
    this.ngoWorkingPhotos,
    this.ngoTeamPhotos,
    this.ngoWorkingPhotoD,
  });

  NGOModel copyWith({
    String? ngoName,
    String? ngoDateofReg,
    String? ngoCity,
    String? ngoState,
    String? ngoBio,
    String? ngoCauses,
    String? ngoOperationalArea,
    String? ngoLogoPhoto,
    String? ngoWorkingPhotos,
    String? ngoTeamPhotos,
    String? ngoWorkingPhotoD,
  }) {
    return NGOModel(
      ngoName: ngoName ?? this.ngoName,
      ngoDateofReg: ngoDateofReg ?? this.ngoDateofReg,
      ngoCity: ngoCity ?? this.ngoCity,
      ngoState: ngoState ?? this.ngoState,
      ngoBio: ngoBio ?? this.ngoBio,
      ngoCauses: ngoCauses ?? this.ngoCauses,
      ngoOperationalArea: ngoOperationalArea ?? this.ngoOperationalArea,
      ngoLogoPhoto: ngoLogoPhoto ?? this.ngoLogoPhoto,
      ngoWorkingPhotos: ngoWorkingPhotos ?? this.ngoWorkingPhotos,
      ngoTeamPhotos: ngoTeamPhotos ?? this.ngoTeamPhotos,
      ngoWorkingPhotoD: ngoWorkingPhotoD ?? this.ngoWorkingPhotoD,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ngoName': ngoName,
      'ngoDateofReg': ngoDateofReg,
      'ngoCity': ngoCity,
      'ngoState': ngoState,
      'ngoBio': ngoBio,
      'ngoCauses': ngoCauses,
      'ngoOperationalArea': ngoOperationalArea,
      'ngoLogoPhoto': ngoLogoPhoto,
      'ngoWorkingPhotos': ngoWorkingPhotos,
      'ngoTeamPhotos': ngoTeamPhotos,
      'ngoWorkingPhotoD': ngoWorkingPhotoD,
    };
  }

  factory NGOModel.fromMap(Map<String, dynamic> map) {
    return NGOModel(
      ngoName: map['ngoName'],
      ngoDateofReg: map['ngoDateofReg'],
      ngoCity: map['ngoCity'],
      ngoState: map['ngoState'],
      ngoBio: map['ngoBio'],
      ngoCauses: map['ngoCauses'],
      ngoOperationalArea: map['ngoOperationalArea'],
      ngoLogoPhoto: map['ngoLogoPhoto'],
      ngoWorkingPhotos: map['ngoWorkingPhotos'],
      ngoTeamPhotos: map['ngoTeamPhotos'],
      ngoWorkingPhotoD: map['ngoWorkingPhotoD'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NGOModel.fromJson(String source) =>
      NGOModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NGOModel(ngoName: $ngoName, ngoDateofReg: $ngoDateofReg, ngoCity: $ngoCity, ngoState: $ngoState, ngoBio: $ngoBio, ngoCauses: $ngoCauses, ngoOperationalArea: $ngoOperationalArea, ngoLogoPhoto: $ngoLogoPhoto, ngoWorkingPhotos: $ngoWorkingPhotos, ngoTeamPhotos: $ngoTeamPhotos, ngoWorkingPhotoD: $ngoWorkingPhotoD)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NGOModel &&
        other.ngoName == ngoName &&
        other.ngoDateofReg == ngoDateofReg &&
        other.ngoCity == ngoCity &&
        other.ngoState == ngoState &&
        other.ngoBio == ngoBio &&
        other.ngoCauses == ngoCauses &&
        other.ngoOperationalArea == ngoOperationalArea &&
        other.ngoLogoPhoto == ngoLogoPhoto &&
        other.ngoWorkingPhotos == ngoWorkingPhotos &&
        other.ngoTeamPhotos == ngoTeamPhotos &&
        other.ngoWorkingPhotoD == ngoWorkingPhotoD;
  }

  @override
  int get hashCode {
    return ngoName.hashCode ^
        ngoDateofReg.hashCode ^
        ngoCity.hashCode ^
        ngoState.hashCode ^
        ngoBio.hashCode ^
        ngoCauses.hashCode ^
        ngoOperationalArea.hashCode ^
        ngoLogoPhoto.hashCode ^
        ngoWorkingPhotos.hashCode ^
        ngoTeamPhotos.hashCode ^
        ngoWorkingPhotoD.hashCode;
  }
}
