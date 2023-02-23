import 'dart:convert';

class UserModel {
  String? userFirstName;
  String? userLastName;
  String? userPhoneNumber;
  String? userUID;
  String? userEmailID;
  String? userGender;
  UserModel({
    this.userFirstName,
    this.userLastName,
    this.userPhoneNumber,
    this.userUID,
    this.userEmailID,
    this.userGender,
  });

  UserModel copyWith({
    String? userFirstName,
    String? userLastName,
    String? userPhoneNumber,
    String? userUID,
    String? userEmailID,
    String? userGender,
  }) {
    return UserModel(
      userFirstName: userFirstName ?? this.userFirstName,
      userLastName: userLastName ?? this.userLastName,
      userPhoneNumber: userPhoneNumber ?? this.userPhoneNumber,
      userUID: userUID ?? this.userUID,
      userEmailID: userEmailID ?? this.userEmailID,
      userGender: userGender ?? this.userGender,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userFirstName': userFirstName,
      'userLastName': userLastName,
      'userPhoneNumber': userPhoneNumber,
      'userUID': userUID,
      'userEmailID': userEmailID,
      'userGender': userGender,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userFirstName: map['userFirstName'],
      userLastName: map['userLastName'],
      userPhoneNumber: map['userPhoneNumber'],
      userUID: map['userUID'],
      userEmailID: map['userEmailID'],
      userGender: map['userGender'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(userFirstName: $userFirstName, userLastName: $userLastName, userPhoneNumber: $userPhoneNumber, userUID: $userUID, userEmailID: $userEmailID, userGender: $userGender)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.userFirstName == userFirstName &&
        other.userLastName == userLastName &&
        other.userPhoneNumber == userPhoneNumber &&
        other.userUID == userUID &&
        other.userEmailID == userEmailID &&
        other.userGender == userGender;
  }

  @override
  int get hashCode {
    return userFirstName.hashCode ^
        userLastName.hashCode ^
        userPhoneNumber.hashCode ^
        userUID.hashCode ^
        userEmailID.hashCode ^
        userGender.hashCode;
  }
}
