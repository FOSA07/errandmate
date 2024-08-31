import 'dart:convert';

class CreateUserModel {
    final String firstname;
    final String lastname;
    final String username;
    final String gender;
    final String matricNumber;
    final String email;
    final String phone;
    final String institution;
    final int faculty;
    final int department;
    final String password;

    CreateUserModel({
        required this.firstname,
        required this.lastname,
        required this.username,
        required this.gender,
        required this.matricNumber,
        required this.email,
        required this.phone,
        required this.institution,
        required this.faculty,
        required this.department,
        required this.password,
    });

    CreateUserModel copyWith({
        String? firstname,
        String? lastname,
        String? username,
        String? gender,
        String? matricNumber,
        String? email,
        String? phone,
        String? institution,
        int? faculty,
        int? department,
        String? password,
    }) => 
        CreateUserModel(
            firstname: firstname ?? this.firstname,
            lastname: lastname ?? this.lastname,
            username: username ?? this.username,
            gender: gender ?? this.gender,
            matricNumber: matricNumber ?? this.matricNumber,
            email: email ?? this.email,
            phone: phone ?? this.phone,
            institution: institution ?? this.institution,
            faculty: faculty ?? this.faculty,
            department: department ?? this.department,
            password: password ?? this.password,
        );

    @override
  String toString() {
    return 'CreateUserModel('
        'firstname: $firstname, '
        'lastname: $lastname, '
        'username: $username, '
        'gender: $gender, '
        'matricNumber: $matricNumber, '
        'email: $email, '
        'phone: $phone, '
        'institution: $institution, '
        'faculty: $faculty, '
        'department: $department, '
        'password: $password'
        ')';
  }

    factory CreateUserModel.fromRawJson(String str) => CreateUserModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateUserModel.fromJson(Map<String, dynamic> json) => CreateUserModel(
        firstname: json["firstname"],
        lastname: json["lastname"],
        username: json["username"],
        gender: json["gender"],
        matricNumber: json["matric_number"],
        email: json["email"],
        phone: json["phone"],
        institution: json["institution"],
        faculty: json["faculty"],
        department: json["department"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "gender": gender,
        "matric_number": matricNumber,
        "email": email,
        "phone": phone,
        "institution": institution,
        "faculty": faculty,
        "department": department,
        "password": password,
    };
}
