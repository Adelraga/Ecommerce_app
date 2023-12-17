import 'package:ecommerce/Features/BottomNavigator/data/store_model/store_model.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view_model/cubit/category_cubit.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view_model/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomCateoryListView extends StatelessWidget {
  const CustomCateoryListView({super.key,});


  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategorySuccess) {
          return SizedBox(
            height:
                MediaQuery.of(context).size.height * 0.05, // Set a fixed height
            child: ListView.builder(
              itemCount: state.category.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 231, 231, 231),
                          borderRadius: BorderRadius.circular(12)),
                      height: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(9),
                        child: GestureDetector(
                            onTap: () {
                                GoRouter.of(context).push('/productDetailItems',extra: state.category[index]);
                                },
                          child: Text("${state.category[index]}")),
                      )),
                );
              },
            ),
          );
        } else if (state is CategoryFailure) {
          return Text("${state.errMessage}");
        } else {
          return Center(child: Text(" Loading... "));
        }
      },
    );
  }
}
