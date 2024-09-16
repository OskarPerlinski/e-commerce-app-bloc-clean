import 'package:e_commerce_app1/data/auth/repository/auth_repository_impl.dart';
import 'package:e_commerce_app1/data/auth/source/auth_firebase_service.dart';
import 'package:e_commerce_app1/data/category.dart/repository/category.dart';
import 'package:e_commerce_app1/data/category/source/category_firebase_service.dart';
import 'package:e_commerce_app1/data/order/repository/order.dart';
import 'package:e_commerce_app1/data/order/source/order_firebase_service.dart';
import 'package:e_commerce_app1/data/product/repository/product.dart';
import 'package:e_commerce_app1/data/product/source/product_firebase_service.dart';
import 'package:e_commerce_app1/domain/auth/repository/auth.dart';
import 'package:e_commerce_app1/domain/auth/usecases/get_user.dart';
import 'package:e_commerce_app1/domain/auth/usecases/is_logged_in.dart';
import 'package:e_commerce_app1/domain/auth/usecases/send_password_email_reset.dart';
import 'package:e_commerce_app1/domain/auth/usecases/signin.dart';
import 'package:e_commerce_app1/domain/auth/usecases/signup.dart';
import 'package:e_commerce_app1/domain/category/repository/category.dart';
import 'package:e_commerce_app1/domain/category/usecases/get_categories.dart';
import 'package:e_commerce_app1/domain/order/repository/order.dart';
import 'package:e_commerce_app1/domain/order/usecases/add_to_cart.dart';
import 'package:e_commerce_app1/domain/order/usecases/get_cart_products.dart';
import 'package:e_commerce_app1/domain/order/usecases/remove_cart_product.dart';
import 'package:e_commerce_app1/domain/product/repository/product.dart';
import 'package:e_commerce_app1/domain/product/usecases/get_new_in.dart';
import 'package:e_commerce_app1/domain/product/usecases/get_products_by_category_id.dart';
import 'package:e_commerce_app1/domain/product/usecases/get_products_by_title.dart';
import 'package:e_commerce_app1/domain/product/usecases/get_top_selling.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

   sl.registerSingleton<CategoryFirebaseService>(
    CategoryFirebaseServiceImpl(),
  );

  sl.registerSingleton<ProductFirebaseService>(
    ProductFirebaseServiceImpl(),
  );

  sl.registerSingleton<OrderFirebaseService>(
    OrderFirebaseServiceImpl(),
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

   sl.registerSingleton<CategoryRepository>(
    CategoryRepositoryImpl(),
  );

   sl.registerSingleton<ProductRepository>(
    ProductRepositoryImpl(),
  );

  sl.registerSingleton<OrderRepository>(
    OrderRepositoryImpl(),
  );

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );

  sl.registerSingleton<SigninUseCase>(
    SigninUseCase(),
  );

  sl.registerSingleton<SendPasswordResetEmailUseCase>(
    SendPasswordResetEmailUseCase(),
  );

  sl.registerSingleton<IsLoggedInUseCase>(
    IsLoggedInUseCase(),
  );

  sl.registerSingleton<GetCategoriesUseCase>(
    GetCategoriesUseCase(),
  );

  sl.registerSingleton<GetTopSellingUseCase>(
    GetTopSellingUseCase(),
  );

  sl.registerSingleton<GetUserUseCase>(
    GetUserUseCase(),
  );

  sl.registerSingleton<GetNewInUseCase>(
    GetNewInUseCase(),
  );

  sl.registerSingleton<GetProductsByCategoryIdUseCse>(
    GetProductsByCategoryIdUseCse(),
  );

  sl.registerSingleton<GetProductsByTitleUseCase>(
    GetProductsByTitleUseCase(),
  );

  sl.registerSingleton<AddToCartUseCase>(
    AddToCartUseCase(),
  );

  sl.registerSingleton<GetCartProductsUseCase>(
    GetCartProductsUseCase(),
  );

  sl.registerSingleton<RemoveCartProductUseCase>(
    RemoveCartProductUseCase(),
  );
  
  
}
