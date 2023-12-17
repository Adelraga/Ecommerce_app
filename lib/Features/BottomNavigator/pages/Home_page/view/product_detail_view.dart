import 'package:ecommerce/Features/BottomNavigator/data/store_model/store_model.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view/widget/product_detail_view_body.dart';
import 'package:flutter/material.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.ProductModel});
  final StoreModel ProductModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailViewBody(
        ProductModel:ProductModel,
      ),
    );
  }
}