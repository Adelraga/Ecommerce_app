import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view/widget/Best_product_list_view_item.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/Home_page/view_model/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestProductListView extends StatelessWidget {
  const BestProductListView({super.key, this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return SizedBox(
            height: height ??
                MediaQuery.of(context).size.height * 0.5, // Set a fixed height
            child: ListView.builder(
              
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return BestSellerListViewItem(
                  ProductModel: state.books[index],
                  imageUrl: state.books[index].image ?? "",
                );
              },
            ),
          );
        } else if (state is ProductsFailure) {
          return Text("${state.errMessage}");
        } else {
          return Center(child: Text("Loading..."));
        }
      },
    );
  }
}
