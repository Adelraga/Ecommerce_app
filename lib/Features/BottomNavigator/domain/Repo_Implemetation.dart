import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/Features/BottomNavigator/data/store_model/store_model.dart';
import 'package:ecommerce/Features/BottomNavigator/domain/Repo.dart';
import 'package:ecommerce/Features/BottomNavigator/domain/api_services.dart';
import 'package:ecommerce/core/errors/failures.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<StoreModel>>> getAllProducts() async {
    try {
      List<dynamic> data = await apiService.get(
          url: 'https://fakestoreapi.com/products', token: '');
      List<StoreModel> productsList = [];

      for (int i = 0; i < data.length; i++) {
        productsList.add(
          StoreModel.fromJson(data[i]),
        );
      }
      return right(productsList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<StoreModel>>> AddProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) {
    // TODO: implement AddProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<String>>> AllcCategoriesServices() async {
    try {
      List<dynamic> data = await apiService.get(
          url: 'https://fakestoreapi.com/products/categories', token: '');

      if (data is List<dynamic>) {
        return right(List<String>.from(data));
      } else {
        // Handle unexpected response format
        return left(ServerFailure('Unexpected response format'));
      }
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


  @override
  Future<Either<Failure, List<StoreModel>>> UpdateProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) {
    // TODO: implement UpdateProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<StoreModel>>> getCategoriesProducts ({required String categoryName}) async {
    try {
       List<dynamic> data = await apiService
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName', token: '');
  List<StoreModel> productsList = [];

      for (int i = 0; i < data.length; i++) {
        productsList.add(
          StoreModel.fromJson(data[i]),
        );
      }
      return right(productsList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
