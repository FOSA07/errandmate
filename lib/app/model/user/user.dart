import 'dart:convert';

class UserModel {
    final dynamic userid;
    final String firstname;
    final String lastname;
    final String username;
    final String gender;
    final String email;
    final String phone;
    final dynamic emailVerifiedAt;
    final dynamic photo;
    final int status;
    final int loginStatus;
    final DateTime createdAt;
    final DateTime updatedAt;
    final String token;

    UserModel({
        required this.userid,
        required this.firstname,
        required this.lastname,
        required this.username,
        required this.gender,
        required this.email,
        required this.phone,
        required this.emailVerifiedAt,
        required this.photo,
        required this.status,
        required this.loginStatus,
        required this.createdAt,
        required this.updatedAt,
        required this.token,
    });

    UserModel copyWith({
        dynamic userid,
        String? firstname,
        String? lastname,
        String? username,
        String? gender,
        String? email,
        String? phone,
        dynamic emailVerifiedAt,
        dynamic photo,
        int? status,
        int? loginStatus,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? token,
    }) => 
        UserModel(
            userid: userid ?? this.userid,
            firstname: firstname ?? this.firstname,
            lastname: lastname ?? this.lastname,
            username: username ?? this.username,
            gender: gender ?? this.gender,
            email: email ?? this.email,
            phone: phone ?? this.phone,
            emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
            photo: photo ?? this.photo,
            status: status ?? this.status,
            loginStatus: loginStatus ?? this.loginStatus,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            token: token ?? this.token,
        );

    factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userid: json["userid"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        username: json["username"],
        gender: json["gender"],
        email: json["email"],
        phone: json["phone"],
        emailVerifiedAt: json["email_verified_at"],
        photo: json["photo"],
        status: json["status"],
        loginStatus: json["login_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "userid": userid,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "gender": gender,
        "email": email,
        "phone": phone,
        "email_verified_at": emailVerifiedAt,
        "photo": photo,
        "status": status,
        "login_status": loginStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "token": token,
    };
}
