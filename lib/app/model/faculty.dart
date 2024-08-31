import 'dart:convert';

class FacultyModel {
    final int id;
    final String instId;
    final String facultyName;
    final DateTime createdAt;
    final DateTime updatedAt;

    FacultyModel({
        required this.id,
        required this.instId,
        required this.facultyName,
        required this.createdAt,
        required this.updatedAt,
    });

    FacultyModel copyWith({
        int? id,
        String? instId,
        String? facultyName,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        FacultyModel(
            id: id ?? this.id,
            instId: instId ?? this.instId,
            facultyName: facultyName ?? this.facultyName,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory FacultyModel.fromRawJson(String str) => FacultyModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    @override
    String toString() {
        return '{id: $id, instId: $instId, facultyName: $facultyName, createdAt: $createdAt, updatedAt: $updatedAt}';
    }

    factory FacultyModel.fromJson(Map<String, dynamic> json) => FacultyModel(
        id: json["id"],
        instId: json["inst_id"],
        facultyName: json["faculty_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "inst_id": instId,
        "faculty_name": facultyName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
