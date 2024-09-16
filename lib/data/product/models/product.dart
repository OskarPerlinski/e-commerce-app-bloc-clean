// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app1/data/product/models/color.dart';
import 'package:e_commerce_app1/domain/product/entities/product.dart';

class ProductModel {
  final String categoryId;
  final String productId;
  final List<ProductColorModel> colors;
  final String title;
  final List<String> sizes;
  final String image;
  final num price;
  final int salesNumber;
  final num discountedPrice;
  final Timestamp createdDate;

  ProductModel({
    required this.categoryId,
    required this.productId,
    required this.title,
    required this.colors,
    required this.sizes,
    required this.price,
    required this.salesNumber,
    required this.discountedPrice,
    required this.image,
    required this.createdDate
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      categoryId: map['categoryId'] as String,
      productId: map['productId'] as String,
      title: map['title'] as String,
      colors: List<ProductColorModel>.from(
          map['colors'].map((e) => ProductColorModel.fromMap(e))),
      sizes: List<String>.from(
        map['sizes'].map((e) => e.toString()),
      ),
      price: map['price'] as num,
      salesNumber: map['salesNumber'] as int,
      discountedPrice: map['discountedPrice'] as num,
      image: map['image'] as String,
      createdDate: map['createdDate'] as Timestamp,
    );
  }
}

extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      categoryId: categoryId,
      colors: colors.map((e) => e.toEntity()).toList(),
      productId: productId,
      title: title,
      sizes: sizes,
      price: price,
      salesNumber: salesNumber,
      discountedPrice: discountedPrice,
      image: image,
      createdDate: createdDate,
    );
  }
}
