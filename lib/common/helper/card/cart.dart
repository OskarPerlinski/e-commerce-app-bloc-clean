import 'package:e_commerce_app1/domain/order/entities/product_ordered.dart';

class CartHelper {

  static double calculateCartTotalSubtotal(List<ProductOrdereEntity> products) {
    double subtotalPrice  = 0;
    for(var item in products) {
      subtotalPrice = subtotalPrice + item.totalPrice;
    }
    return subtotalPrice;

  }
}