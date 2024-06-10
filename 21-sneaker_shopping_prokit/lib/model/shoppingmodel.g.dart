import 'dart:convert';

class Shoppingmodel {
  const Shoppingmodel({
    required this.name,
    required this.id,
  });

  factory Shoppingmodel.fromMap(Map<String, dynamic> map) {
    return Shoppingmodel(
      name: map['name'],
      id: map['id'].toInt(),
    );
  }

  factory Shoppingmodel.fromJson(String source) => Shoppingmodel.fromMap(json.decode(source));

  final String name;

  final int id;

  Shoppingmodel copyWith({
    String? name,
    int? id,
  }) {
    return Shoppingmodel(
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

    return other is Shoppingmodel && other.name == name && other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^ id.hashCode;
  }

  @override
  String toString() {
    return 'Shoppingmodel(name: $name, id: $id)';
  }
}
