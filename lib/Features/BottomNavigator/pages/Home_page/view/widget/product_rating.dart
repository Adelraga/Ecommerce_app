import 'package:ecommerce/core/utils/syles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ProductRating extends StatelessWidget {
  const ProductRating({this.mainAxisAlignment = MainAxisAlignment.start, required this.rating, required this.count});
  final MainAxisAlignment mainAxisAlignment;
  final double rating;
  final num count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 16,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(rating.toString(),
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(count.toString(),
              style: Styles.textStyle14.copyWith(color: Color(0xffffffff))),
        ),
      ],
    );
  }
}
