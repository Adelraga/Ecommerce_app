import 'package:dartz/dartz.dart';
import 'package:ecommerce/Features/BottomNavigator/data/store_model/store_model.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<StoreModel>>> getAllProducts();
  Future<Either<Failure, List<StoreModel>>> getCategoriesProducts(
      {required String categoryName});
  Future<Either<Failure, List<String>>> AllcCategoriesServices();
  Future<Either<Failure, List<StoreModel>>> AddProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category});
  Future<Either<Failure, List<StoreModel>>> UpdateProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category});
}
