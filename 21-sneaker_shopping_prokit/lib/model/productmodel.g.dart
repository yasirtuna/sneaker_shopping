import 'dart:convert';

class Productmodel {
  const Productmodel({
    required this.id,
    required this.name,
  });

  factory Productmodel.fromMap(Map<String, dynamic> map) {
    return Productmodel(
      id: map['id'].toInt(),
      name: map['name'],
    );
  }

  factory Productmodel.fromJson(String source) => Productmodel.fromMap(json.decode(source));

  final int id;

  final String name;

  Productmodel copyWith({
    int? id,
    String? name,
  }) {
    return Productmodel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Productmodel && other.id == id && other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode;
  }

  @override
  String toString() {
    return 'Productmodel(id: $id, name: $name)';
  }
}
