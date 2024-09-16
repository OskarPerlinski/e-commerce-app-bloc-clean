// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app1/domain/product/entities/color.dart';

class ProductEntity {
  final String categoryId;
  final String productId;
  final List<ProductColorEntity> colors;
  final List<String> sizes;
  final num price;
  final int salesNumber;
  final num discountedPrice;
  final String image;
  final Timestamp createdDate;

  final String title;

  ProductEntity(
      {required this.categoryId,
      required this.image,
      required this.productId,
      required this.colors,
      required this.title,
      required this.sizes,
      required this.price,
      required this.salesNumber,
      required this.discountedPrice,
      required this.createdDate,
      });
}
