import 'package:dartz/dartz.dart';
import 'package:e_commerce_app1/data/order/models/add_to_cart_req.dart';
import 'package:e_commerce_app1/data/order/models/product_ordered.dart';
import 'package:e_commerce_app1/data/order/source/order_firebase_service.dart';
import 'package:e_commerce_app1/domain/order/repository/order.dart';
import 'package:e_commerce_app1/service_locator.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
    return sl<OrderFirebaseService>().addToCart(addToCartReq);
  }

  @override
  Future<Either> getCartProducts() async {
    var returnedData = await sl<OrderFirebaseService>().getCartProducts();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(List.from(data)
            .map((e) => ProductOrdereModel.fromMap(e).toEntity())
            .toList());
      },
    );
  }

  @override
  Future<Either> removeCartProduct(String id) async {
var returnedData = await sl<OrderFirebaseService>().removeCartProduct(id);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (message) {
        return Right(message);
      },
    );  }
}
