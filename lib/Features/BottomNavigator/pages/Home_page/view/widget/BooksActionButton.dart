import 'package:ecommerce/Features/BottomNavigator/data/store_model/store_model.dart';
import 'package:ecommerce/core/CustomButton.dart';
import 'package:ecommerce/core/services/stripe_payment/payment_manager.dart';
import 'package:flutter/material.dart';

class ProductActionButton extends StatelessWidget {
  const ProductActionButton({super.key, required this.ProductModel});
  final StoreModel ProductModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: () {
                PaymentManager.makePayment(ProductModel.price!.toInt(), "USD");
              },
              title: 'pay:  \$${ProductModel.price}',
              textColor: const Color.fromARGB(255, 41, 41, 41),
              buttonColor: Color.fromARGB(255, 234, 234, 234),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {},
              title: ProductModel.category ?? "",
              textColor: Colors.white,
              buttonColor: Color.fromARGB(255, 0, 71, 109),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }
}
