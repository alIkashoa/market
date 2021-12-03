import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:swiggy_ui/widgets/responsive.dart';


class OfferBannerView extends StatelessWidget {
  final List<String> images = [
    'assets/images/old.jpeg',
    'assets/images/eco.jpg',
    'assets/images/bestrated.jpg',
    'assets/images/car.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);

    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0),
        height: isTabletDesktop ? 260.0 : 180.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isTabletDesktop ? 13.0 : 10.0),
        ),
        child: Swiper(
          itemHeight: 100,
          duration: 500,
          itemWidth: double.infinity,
          pagination: SwiperPagination(),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) => Image.asset(
            images[index],
            fit: BoxFit.cover,
          ),
          autoplay: true,
          viewportFraction: 1.0,
          scale: 0.9,
        ),
      ),
      onTap: () {

      },
    );
  }
}
