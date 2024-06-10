import 'dart:convert';

class Selmaprofile {
  const Selmaprofile({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.uuid,
  });

  factory Selmaprofile.fromMap(Map<String, dynamic> map) {
    return Selmaprofile(
      id: map['id'].toInt(),
      name: map['name'],
      address: map['address'],
      city: map['city'],
      uuid: map['uuid'].toInt(),
    );
  }

  factory Selmaprofile.fromJson(String source) => Selmaprofile.fromMap(json.decode(source));

  final int id;

  final String name;

  final String address;

  final String city;

  final int uuid;

  Selmaprofile copyWith({
    int? id,
    String? name,
    String? address,
    String? city,
    int? uuid,
  }) {
    return Selmaprofile(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      city: city ?? this.city,
      uuid: uuid ?? this.uuid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'city': city,
      'uuid': uuid,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Selmaprofile &&
        other.id == id &&
        other.name == name &&
        other.address == address &&
        other.city == city &&
        other.uuid == uuid;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ address.hashCode ^ city.hashCode ^ uuid.hashCode;
  }

  @override
  String toString() {
    return 'Selmaprofile(id: $id, name: $name, address: $address, city: $city, uuid: $uuid)';
  }
}
