import 'package:swiggy_ui/models/user.dart';

class SpotlightBestTopFood {
  const SpotlightBestTopFood({
    required this.image,
    required this.name,
    required this.desc,
    required this.coupon,
    required this.ratingTimePrice,
    required this.usr,
  });

  final String image;
  final String name;
  final String desc;
  final String coupon;
  final String ratingTimePrice;
  final Users usr;
  }