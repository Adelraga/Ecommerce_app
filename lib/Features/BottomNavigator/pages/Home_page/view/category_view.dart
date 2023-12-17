import 'package:ecommerce/Features/BottomNavigator/data/store_model/store_model.dart';
import 'package:ecommerce/Features/BottomNavigator/domain/Repo_Implemetation.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view/widget/Category_view_body.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view_model/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key, required this.ProductModel});
  final String ProductModel;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  void initState() {
    BlocProvider.of<CategoryCubit>(context).fetchCategoryItems(category: widget.ProductModel);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoryViewBody(),
    );
  }
}