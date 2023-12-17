import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce/core/constant.dart';
import 'package:flutter/material.dart';

class HomeSwiper extends StatelessWidget {
  const HomeSwiper({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
      ),
      child: SizedBox(
        height: size,
        width: MediaQuery.of(context).size.width * .95,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              offerImages[index],
              fit: BoxFit.fill,
            );
          },
          itemCount: offerImages.length,
          pagination: const SwiperPagination(
              builder: DotSwiperPaginationBuilder(
            color: Color.fromARGB(255, 241, 241, 241),
            activeColor: Color.fromARGB(255, 140, 140, 140),
          )),
          duration: Duration.millisecondsPerSecond,
          transformer: ScaleAndFadeTransformer(),
          curve: Curves.ease,
          autoplay: true,
          outer: true,
        ),
      ),
    );
  }
}
