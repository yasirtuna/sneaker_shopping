import 'dart:convert';

class Accountmodel {
  const Accountmodel({
    required this.name,
    required this.id,
  });

  factory Accountmodel.fromMap(Map<String, dynamic> map) {
    return Accountmodel(
      name: map['name'],
      id: map['id'].toInt(),
    );
  }

  factory Accountmodel.fromJson(String source) => Accountmodel.fromMap(json.decode(source));

  final String name;

  final int id;

  Accountmodel copyWith({
    String? name,
    int? id,
  }) {
    return Accountmodel(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Accountmodel && other.name == name && other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^ id.hashCode;
  }

  @override
  String toString() {
    return 'Accountmodel(name: $name, id: $id)';
  }
}
