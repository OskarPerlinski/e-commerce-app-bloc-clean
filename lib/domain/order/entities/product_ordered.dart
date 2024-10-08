// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProductOrdereEntity {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final String productColor;
  final String productSize;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String createdDate;
  final String id;

  ProductOrdereEntity(
      {required this.productId,
      required this.productTitle,
      required this.productQuantity,
      required this.productColor,
      required this.productSize,
      required this.productPrice,
      required this.totalPrice,
      required this.productImage,
      required this.createdDate,
      required this.id});

  
}
