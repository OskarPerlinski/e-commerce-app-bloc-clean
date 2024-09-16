// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:e_commerce_app1/domain/auth/entity/user.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final String email;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      firstName: firstName,
      lastName: lastName,
      email: email,
    );
  }
}
