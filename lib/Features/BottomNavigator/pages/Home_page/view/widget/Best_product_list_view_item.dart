import 'package:ecommerce/Features/BottomNavigator/data/store_model/store_model.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view/widget/Custom_image.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view/widget/product_rating.dart';
import 'package:ecommerce/core/constant.dart';
import 'package:ecommerce/core/utils/syles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem(
      {super.key, required this.ProductModel, required this.imageUrl});
  final StoreModel ProductModel;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       GoRouter.of(context).push('/productDetail',extra: ProductModel);
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            CustomImage(imageUrl: ProductModel.image.toString()),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(ProductModel.title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: KGtSectraFine)),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    ProductModel.category! ,
                    overflow: TextOverflow.ellipsis, 
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$${ProductModel.price}",
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      ProductRating(rating: ProductModel.rating?.rate ?? 0, count: ProductModel.rating?.count ?? 0)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
