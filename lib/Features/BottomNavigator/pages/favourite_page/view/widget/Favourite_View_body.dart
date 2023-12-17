import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view/widget/Best_product_list_view.dart';
import 'package:flutter/material.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Our Favourite Products",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Text(
                    "------------------------------",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                BestProductListView(
                  height: MediaQuery.of(context).size.height,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
