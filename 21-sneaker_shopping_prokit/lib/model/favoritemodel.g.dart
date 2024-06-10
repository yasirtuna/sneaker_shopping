import 'dart:convert';

class Favoritemodel {
  const Favoritemodel({
    required this.name,
    required this.id,
    required this.subtitle,
    required this.amount,
    required this.img,
  });

  factory Favoritemodel.fromMap(Map<String, dynamic> map) {
    return Favoritemodel(
      name: map['name'],
      id: map['id'].toInt(),
      subtitle: map['subtitle'],
      amount: map['amount'],
      img: map['img'],
    );
  }

  factory Favoritemodel.fromJson(String source) => Favoritemodel.fromMap(json.decode(source));

  final String name;

  final int id;

  final String subtitle;

  final String amount;

  final String img;

  Favoritemodel copyWith({
    String? name,
    int? id,
    String? subtitle,
    String? amount,
    String? img,
  }) {
    return Favoritemodel(
      name: name ?? this.name,
      id: id ?? this.id,
      subtitle: subtitle ?? this.subtitle,
      amount: amount ?? this.amount,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'subtitle': subtitle,
      'amount': amount,
      'img': img,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Favoritemodel &&
        other.name == name &&
        other.id == id &&
        other.subtitle == subtitle &&
        other.amount == amount &&
        other.img == img;
  }

  @override
  int get hashCode {
    return name.hashCode ^ id.hashCode ^ subtitle.hashCode ^ amount.hashCode ^ img.hashCode;
  }

  @override
  String toString() {
    return 'Favoritemodel(name: $name, id: $id, subtitle: $subtitle, amount: $amount, img: $img)';
  }
}
