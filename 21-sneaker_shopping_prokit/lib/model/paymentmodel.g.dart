import 'dart:convert';

class Paymentmodel {
  const Paymentmodel({
    required this.img,
    required this.id,
    required this.name,
  });

  factory Paymentmodel.fromMap(Map<String, dynamic> map) {
    return Paymentmodel(
      img: map['img'],
      id: map['id'].toInt(),
      name: map['name'],
    );
  }

  factory Paymentmodel.fromJson(String source) => Paymentmodel.fromMap(json.decode(source));

  final String img;

  final int id;

  final String name;

  Paymentmodel copyWith({
    String? img,
    int? id,
    String? name,
  }) {
    return Paymentmodel(
      img: img ?? this.img,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'img': img,
      'id': id,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Paymentmodel && other.img == img && other.id == id && other.name == name;
  }

  @override
  int get hashCode {
    return img.hashCode ^ id.hashCode ^ name.hashCode;
  }

  @override
  String toString() {
    return 'Paymentmodel(img: $img, id: $id, name: $name)';
  }
}
