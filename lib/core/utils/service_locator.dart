
import 'package:dio/dio.dart';
import 'package:ecommerce/Features/BottomNavigator/domain/Repo_Implemetation.dart';
import 'package:ecommerce/Features/BottomNavigator/domain/api_services.dart';
import 'package:get_it/get_it.dart';



final getIt = GetIt.instance;
void setup() { 
    getIt.registerSingleton<ApiService>(ApiService());   /// here a singleton for apiservice
 // singleton is the used of method we take acopy of it many times so we make it one time and reused it  /// here a singleton for apiservice
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));  // here singleton for homerepo
}
