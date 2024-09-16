import 'package:dartz/dartz.dart';
import 'package:e_commerce_app1/data/order/models/add_to_cart_req.dart';

abstract class OrderRepository {

  Future<Either> addToCart(AddToCartReq addToCartReq);
    Future<Either> getCartProducts();
    Future<Either> removeCartProduct(String id);

}