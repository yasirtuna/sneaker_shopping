import 'dart:convert';

class Alldata {
  const Alldata({
    required this.img,
    required this.id,
    required this.name,
    required this.subtitle,
    required this.amount,
  });

  factory Alldata.fromMap(Map<String, dynamic> map) {
    return Alldata(
      img: map['img'],
      id: map['id'].toInt(),
      name: map['name'],
      subtitle: map['subtitle'],
      amount: map['amount'],
    );
  }

  factory Alldata.fromJson(String source) => Alldata.fromMap(json.decode(source));

  final String img;

  final int id;

  final String name;

  final String subtitle;

  final String amount;

  Alldata copyWith({
    String? img,
    int? id,
    String? name,
    String? subtitle,
    String? amount,
  }) {
    return Alldata(
      img: img ?? this.img,
      id: id ?? this.id,
      name: name ?? this.name,
      subtitle: subtitle ?? this.subtitle,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'img': img,
      'id': id,
      'name': name,
      'subtitle': subtitle,
      'amount': amount,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Alldata &&
        other.img == img &&
        other.id == id &&
        other.name == name &&
        other.subtitle == subtitle &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    return img.hashCode ^ id.hashCode ^ name.hashCode ^ subtitle.hashCode ^ amount.hashCode;
  }

  @override
  String toString() {
    return 'Alldata(img: $img, id: $id, name: $name, subtitle: $subtitle, amount: $amount)';
  }
}
