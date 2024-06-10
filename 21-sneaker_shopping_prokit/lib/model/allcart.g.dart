import 'dart:convert';

class Allcart {
  const Allcart({
    required this.name,
    required this.id,
    required this.img,
    required this.subtitle,
    required this.amount,
  });

  factory Allcart.fromMap(Map<String, dynamic> map) {
    return Allcart(
      name: map['name'],
      id: map['id'].toInt(),
      img: map['img'],
      subtitle: map['subtitle'],
      amount: map['amount'],
    );
  }

  factory Allcart.fromJson(String source) => Allcart.fromMap(json.decode(source));

  final String name;

  final int id;

  final String img;

  final String subtitle;

  final String amount;

  Allcart copyWith({
    String? name,
    int? id,
    String? img,
    String? subtitle,
    String? amount,
  }) {
    return Allcart(
      name: name ?? this.name,
      id: id ?? this.id,
      img: img ?? this.img,
      subtitle: subtitle ?? this.subtitle,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'img': img,
      'subtitle': subtitle,
      'amount': amount,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Allcart &&
        other.name == name &&
        other.id == id &&
        other.img == img &&
        other.subtitle == subtitle &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    return name.hashCode ^ id.hashCode ^ img.hashCode ^ subtitle.hashCode ^ amount.hashCode;
  }

  @override
  String toString() {
    return 'Allcart(name: $name, id: $id, img: $img, subtitle: $subtitle, amount: $amount)';
  }
}
