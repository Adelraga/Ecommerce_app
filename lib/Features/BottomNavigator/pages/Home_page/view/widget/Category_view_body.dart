import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view/widget/Best_product_list_view_item.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view_model/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryItemsSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height, // Set a fixed height
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ListView.builder(
                  shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(),
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    return BestSellerListViewItem(
                      ProductModel: state.books[index],
                      imageUrl: state.books[index].image ?? "",
                    );
                  },
                ),
              ),
            ),
          );
        } else if (state is CategoryFailure) {
          return Text("${state.errMessage}");
        } else {
          return Center(child: Text("Loading..."));
        }
      },
    );
  }
}
