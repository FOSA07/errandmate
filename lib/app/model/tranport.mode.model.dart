import 'dart:convert';

class TransportMode {
  final int? id;
  final String? modeId;
  final String? distance;
  final String? distanceMeasure;
  final String? price;
  final String? discountPrice;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Mode? mode;

  TransportMode({
    this.id,
    this.modeId,
    this.distance,
    this.distanceMeasure,
    this.price,
    this.discountPrice,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.mode,
  });

  TransportMode copyWith({
    int? id,
    String? modeId,
    String? distance,
    String? distanceMeasure,
    String? price,
    String? discountPrice,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    Mode? mode,
  }) =>
      TransportMode(
        id: id ?? this.id,
        modeId: modeId ?? this.modeId,
        distance: distance ?? this.distance,
        distanceMeasure: distanceMeasure ?? this.distanceMeasure,
        price: price ?? this.price,
        discountPrice: discountPrice ?? this.discountPrice,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        mode: mode ?? this.mode,
      );

  factory TransportMode.fromJson(String str) =>
      TransportMode.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransportMode.fromMap(Map<String, dynamic> json) => TransportMode(
        id: json["id"],
        modeId: json["mode_id"],
        distance: json["distance"],
        distanceMeasure: json["distance_measure"],
        price: json["price"],
        discountPrice: json["discount_price"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        mode: json["mode"] == null ? null : Mode.fromMap(json["mode"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "mode_id": modeId,
        "distance": distance,
        "distance_measure": distanceMeasure,
        "price": price,
        "discount_price": discountPrice,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "mode": mode?.toMap(),
      };
}

class Mode {
  final int? id;
  final String? name;
  final dynamic code;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Mode({
    this.id,
    this.name,
    this.code,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Mode copyWith({
    int? id,
    String? name,
    dynamic code,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Mode(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Mode.fromJson(String str) => Mode.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Mode.fromMap(Map<String, dynamic> json) => Mode(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "code": code,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
