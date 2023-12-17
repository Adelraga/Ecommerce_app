import 'package:ecommerce/Features/BottomNavigator/domain/Repo_Implemetation.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view_model/cubit/category_cubit.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view_model/cubit/products_cubit.dart';
import 'package:ecommerce/blocObserver.dart';
import 'package:ecommerce/core/services/stripe_payment/stripe_keys.dart';
import 'package:ecommerce/core/utils/App_Router.dart';
import 'package:ecommerce/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'Features/Auth/presentation/pages/login/model_view/cubit/login_cubit/login_cubit.dart';
import 'Features/Auth/presentation/pages/login/model_view/cubit/login_cubit/register_cubit/register_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  setup();
   Stripe.publishableKey=ApiKeys.publishableKey;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   Bloc.observer=SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => ProductsCubit(getIt.get<HomeRepoImpl>())..fetchProduct(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(getIt.get<HomeRepoImpl>())..fetchCategory(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
