import 'dart:convert';

class InstitutionModel {
    final String id;
    final String instName;
    final String matricNoFormat;
    final DateTime createdAt;
    final DateTime updatedAt;

    InstitutionModel({
        required this.id,
        required this.instName,
        required this.matricNoFormat,
        required this.createdAt,
        required this.updatedAt,
    });

    InstitutionModel copyWith({
        String? id,
        String? instName,
        String? matricNoFormat,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        InstitutionModel(
            id: id ?? this.id,
            instName: instName ?? this.instName,
            matricNoFormat: matricNoFormat ?? this.matricNoFormat,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    @override
    String toString() {
        return '{id: $id, instName: $instName, matricNoFormat: $matricNoFormat, createdAt: $createdAt, updatedAt: $updatedAt}';
    }

    factory InstitutionModel.fromRawJson(String str) => InstitutionModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory InstitutionModel.fromJson(Map<String, dynamic> json) => InstitutionModel(
        id: json["id"],
        instName: json["inst_name"],
        matricNoFormat: json["matric_no_format"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "inst_name": instName,
        "matric_no_format": matricNoFormat,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
