// To parse this JSON data, do
//
//     final userProfileModel = userprofilemodelFromJson(jsonString);

import 'dart:convert';

userProfileModel userprofilemodelFromJson(String str) => userProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(userProfileModel data) => json.encode(data.toJson());

class userProfileModel {
    userProfileModel({
        required this.age,
        required this.email,
        required this.firstname,
        required this.lastname,
    });

    int age;
    String email;
    String firstname;
    String lastname;

    factory userProfileModel.fromJson(Map<String, dynamic> json) => userProfileModel(
        age: json["age"],
        email: json["email"],
        firstname: json["firstname"],
        lastname: json["lastname"],
    );

    Map<String, dynamic> toJson() => {
        "age": age,
        "email": email,
        "firstname": firstname,
        "lastname": lastname,
    };
}
