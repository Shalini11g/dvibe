import 'dart:convert';

Profile ProfileFromJson(String str) => Profile.fromJson(json.decode(str));

String ProfileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.email,
    required this.fullName,
  });

  String email;
  String fullName;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        email: json["email"],
        fullName: json["fullName"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "fullName": fullName,
      };
}
