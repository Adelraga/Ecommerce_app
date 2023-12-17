import 'package:ecommerce/Features/BottomNavigator/data/store_model/store_model.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view/widget/BooksActionButton.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view/widget/Custom_image.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view/widget/product_rating.dart';
import 'package:ecommerce/core/utils/syles.dart';
import 'package:flutter/material.dart';

class ProductDetailViewBody extends StatelessWidget {
  const ProductDetailViewBody({super.key, required this.ProductModel});
  final StoreModel ProductModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .2),
                  child: CustomImage(
                    imageUrl: ProductModel.image ?? '',
                  ),
                ),
                const SizedBox(
                  height: 43,
                ),
                Text(
                  ProductModel.title!,
                  style: Styles.textStyle30,
                ),
                const SizedBox(
                  height: 6,
                ),
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    ProductModel.description!,
                    style: Styles.textStyle18.copyWith(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                ProductRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                  rating: ProductModel.rating?.rate! ?? 0,
                  count: ProductModel.rating?.rate ?? 0,
                ),
                const SizedBox(
                  height: 37,
                ),
                ProductActionButton(ProductModel: ProductModel),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
