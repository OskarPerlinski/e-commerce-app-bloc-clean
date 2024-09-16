// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:e_commerce_app1/domain/product/entities/color.dart';

class ProductColorModel {
  final String title;
  final List<int> rgb;

  ProductColorModel({
    required this.title,
    required this.rgb,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'rgb': rgb,
    };
  }

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    return ProductColorModel(
      title: map['title'] as String,
      rgb: List < int > .from(
        map['rgb'].map((e) => e),
      )
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductColorModel.fromJson(String source) => ProductColorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension ProductColorXModel on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(
      title: title,
      rgb: rgb
    );
  }
}
