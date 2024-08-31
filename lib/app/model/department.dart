import 'dart:convert';

class DepartmentModel {
    final int id;
    final String facultyId;
    final String departmentName;
    final DateTime createdAt;
    final DateTime updatedAt;

    DepartmentModel({
        required this.id,
        required this.facultyId,
        required this.departmentName,
        required this.createdAt,
        required this.updatedAt,
    });

    DepartmentModel copyWith({
        int? id,
        String? facultyId,
        String? departmentName,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        DepartmentModel(
            id: id ?? this.id,
            facultyId: facultyId ?? this.facultyId,
            departmentName: departmentName ?? this.departmentName,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory DepartmentModel.fromRawJson(String str) => DepartmentModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DepartmentModel.fromJson(Map<String, dynamic> json) => DepartmentModel(
        id: json["id"],
        facultyId: json["faculty_id"],
        departmentName: json["department_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "faculty_id": facultyId,
        "department_name": departmentName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
