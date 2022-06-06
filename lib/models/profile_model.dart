import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class ProfileModel extends ChangeNotifier{
  int id, gender, birthYear, birthMonth, birthDay;
  String firstName, lastName, mobile, email;

  ProfileModel({
    this.id = 0,
    this.gender = -1,
    this.firstName = "",
    this.lastName = "",
    this.birthYear = 0,
    this.birthMonth = 0,
    this.birthDay = 0,
    this.mobile = "",
    this.email = ""
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: int.tryParse( json['id'] ) ?? 0,
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: int.tryParse( json['gender'] ) ?? -1,
      birthYear: int.tryParse( json['birthYear'] ) ?? -1,
      birthMonth: int.tryParse( json['birthMonth'] ) ?? -1,
      birthDay: int.tryParse( json['birthDay'] ) ?? -1,
      mobile: json['mobile'],
      email: json['email'],
    );
  }
  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
        'birthYear': birthYear,
        'birthMonth': birthMonth,
        'birthDay': birthDay,
        'mobile': mobile,
        'email': email,
      };

  void changeFirstName( String value ){
    firstName = value;
  }
  void changeLastName( String value ){
    lastName = value;
  }

  void changeEmail( String value ){
    email = value;
  }


  void changeGender( int value ){
    gender = value;
    notifyListeners();
  }
  void changeBirthday( int? birthYearVal, int? birthMonthVal, int? birthDayVal ){
    birthYear = birthYearVal ?? -1;
    birthMonth = birthMonthVal ?? -1;
    birthDay = birthDayVal ?? -1;
    notifyListeners();
  }
}
