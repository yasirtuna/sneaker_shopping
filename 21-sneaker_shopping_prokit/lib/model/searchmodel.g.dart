import 'dart:convert';

class Searchmodel {
  const Searchmodel({
    required this.name,
    required this.img,
    required this.subtitle,
    required this.id,
  });

  factory Searchmodel.fromMap(Map<String, dynamic> map) {
    return Searchmodel(
      name: map['name'],
      img: map['img'],
      subtitle: map['subtitle'],
      id: map['id'].toInt(),
    );
  }

  factory Searchmodel.fromJson(String source) => Searchmodel.fromMap(json.decode(source));

  final String name;

  final String img;

  final String subtitle;

  final int id;

  Searchmodel copyWith({
    String? name,
    String? img,
    String? subtitle,
    int? id,
  }) {
    return Searchmodel(
      name: name ?? this.name,
      img: img ?? this.img,
      subtitle: subtitle ?? this.subtitle,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'img': img,
      'subtitle': subtitle,
      'id': id,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Searchmodel &&
        other.name == name &&
        other.img == img &&
        other.subtitle == subtitle &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^ img.hashCode ^ subtitle.hashCode ^ id.hashCode;
  }

  @override
  String toString() {
    return 'Searchmodel(name: $name, img: $img, subtitle: $subtitle, id: $id)';
  }
}
