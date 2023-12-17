
import 'package:ecommerce/Features/Auth/presentation/pages/login/view/login_view.dart';
import 'package:ecommerce/Features/BottomNavigator/data/store_model/store_model.dart';
import 'package:ecommerce/Features/BottomNavigator/domain/Repo_Implemetation.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view/category_view.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view/product_detail_view.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view_model/cubit/category_cubit.dart';
import 'package:ecommerce/Features/BottomNavigator/presentation/view/widget/bottom_nav_body.dart';
import 'package:ecommerce/Features/splash/presentation/views/splash_view.dart';
import 'package:ecommerce/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';



abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/loginView',
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: '/nav',
      builder: (context, state) => BottomNavBar(),
    ),
    GoRoute(
      path: '/productDetail',
      builder:(context, state) => ProductDetailView(
          ProductModel: state.extra as StoreModel,
        ),
      ),
    GoRoute(
       path: '/productDetailItems',
      builder: (context, state) => BlocProvider(
        create: (context) => CategoryCubit(
          getIt.get<HomeRepoImpl>()
        ),
        child: CategoryView(
          ProductModel:  state.extra as String,
        ),
      ),
      ),
  ]);
}
