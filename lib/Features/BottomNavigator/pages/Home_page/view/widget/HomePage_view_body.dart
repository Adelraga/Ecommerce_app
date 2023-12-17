import 'package:ecommerce/Features/BottomNavigator/data/store_model/store_model.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view/widget/Best_product_list_view.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view/widget/Best_product_list_view_item.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view/widget/CustomCateory_ListView.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view/widget/Custom_welcome_title.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view/widget/custom_searckh_widget.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view/widget/home_swiper.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view_model/cubit/products_cubit.dart';
import 'package:ecommerce/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
         physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                welcome_widget(),
                SizedBox(height: 30),
                CustomSearchWidget(),
                SizedBox(height: 30),
                HomeSwiper(size: MediaQuery.of(context).size.height * 0.25),
                CustomCateoryListView(),
              ],
            ),
          ),
            const SliverToBoxAdapter(
              child: BestProductListView(),
            ),
        ],
      ),
    );
  }
}
