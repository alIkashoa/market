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

//   static List<List<SpotlightBestTopFood>> getSpotlightRestaurants() {
//     return const [
//       [
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'hamtr Expresss',
//           desc: 'Continental North Indian, South Indian',
//           coupon: '20 \$ off | Use JUMBO',
//           ratingTimePrice: '4.1 45 mins - Rs 200 for two',
//         ),
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'Namma Veedu Bhavan',
//           desc: 'South Indian',
//           coupon: '20 \$ off | Use SWIGGYIT',
//           ratingTimePrice: '4.1 35 mins - Rs 150 for two',
//         ),
//       ],
//       [
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'A2B Chennai',
//           desc: 'South Indian',
//           coupon: '30 \$ off | Use A2BSUPER',
//           ratingTimePrice: '4.2 32 mins - Rs 130 for two',
//         ),
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'Dinner Expresss',
//           desc: 'North Indian',
//           coupon: '20 \$ off | Use JUMBO',
//           ratingTimePrice: '3.8 25 mins - Rs 200 for two',
//         ),
//       ],
//       [
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'Parota King',
//           desc: 'South Indian',
//           coupon: '20 \$ off | Use SWIGGYIT',
//           ratingTimePrice: '4.1 55 mins - Rs 100 for two',
//         ),
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'Mass Hotel',
//           desc: 'South Indian',
//           coupon: '30 \$ off | Use JUMBO',
//           ratingTimePrice: '4.3 22 mins - Rs 150 for two',
//         ),
//       ],
//       [
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'Mumbai Mirchi',
//           desc: 'South Indian',
//           coupon: '20 \$ off | Use JUMBO',
//           ratingTimePrice: '4.1 25 mins - Rs 120 for two',
//         ),
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'BBQ Nation',
//           desc: 'South Indian',
//           coupon: '30 \$ off | Use JUMBO',
//           ratingTimePrice: '4.3 42 mins - Rs 350 for two',
//         ),
//       ]
//     ];
//   }

//   static List<List<SpotlightBestTopFood>> getBestRestaurants() {
//     return [
//       [
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'Mirchi Hotel',
//           desc: 'South Indian',
//           coupon: '30 \$ off | Use JUMBO',
//           ratingTimePrice: '4.3 22 mins - Rs 150 for two',
//         ),
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'BBQ Expresss',
//           desc: 'Continental North Indian, South Indian',
//           coupon: '20 \$ off | Use JUMBO',
//           ratingTimePrice: '4.1 15 mins - Rs 200 for two',
//         ),
//       ],
//       [
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'Lunch Expresss',
//           desc: 'North Indian',
//           coupon: '20 \$ off | Use JUMBO',
//           ratingTimePrice: '3.8 35 mins - Rs 200 for two',
//         ),
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'A2B Chennai',
//           desc: 'South Indian',
//           coupon: '30 \$ off | Use A2BSUPER',
//           ratingTimePrice: '4.2 42 mins - Rs 130 for two',
//         ),
//       ],
//       [
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'Mirchi Hotel',
//           desc: 'South Indian',
//           coupon: '30 \$ off | Use JUMBO',
//           ratingTimePrice: '4.3 22 mins - Rs 150 for two',
//         ),
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'Parota World',
//           desc: 'South Indian',
//           coupon: '20 \$ off | Use SWIGGYIT',
//           ratingTimePrice: '4.1 25 mins - Rs 100 for two',
//         ),
//       ],
//       [
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'Chennai Mirchi',
//           desc: 'South Indian',
//           coupon: '20 \$ off | Use JUMBO',
//           ratingTimePrice: '4.1 25 mins - Rs 120 for two',
//         ),
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'BBQ Nation',
//           desc: 'South Indian',
//           coupon: '30 \$ off | Use JUMBO',
//           ratingTimePrice: '4.3 45 mins - Rs 350 for two',
//         ),
//       ]
//     ];
//   }

//   static List<List<SpotlightBestTopFood>> getTopRestaurants() {
//     return [
//       [
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'A2B Chennaisdfghjk',
//           desc: 'South Indian',
//           coupon: '30 \$ off | Use A2BSUPER',
//           ratingTimePrice: '4.2 32 mins - Rs 130 for two',
//         ),
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'Biryani Expresss',
//           desc: 'North Indian',
//           coupon: '20 \$ off | Use JUMBO',
//           ratingTimePrice: '3.8 15 mins - Rs 200 for two',
//         ),
//       ],
//       [
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'Chai Truck',
//           desc: 'Continental North Indian, South Indian',
//           coupon: '20 \$ off | Use JUMBO',
//           ratingTimePrice: '4.1 25 mins - Rs 200 for two',
//         ),
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'Shiva Bhavan',
//           desc: 'South Indian',
//           coupon: '20 \$ off | Use SWIGGYIT',
//           ratingTimePrice: '4.1 35 mins - Rs 150 for two',
//         ),
//       ],
//       [
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'BBQ King',
//           desc: 'South Indian',
//           coupon: '20 \$ off | Use JUMBO',
//           ratingTimePrice: '4.1 25 mins - Rs 120 for two',
//         ),
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'Pizza Corner',
//           desc: 'South Indian',
//           coupon: '30 \$ off | Use JUMBO',
//           ratingTimePrice: '4.3 47 mins - Rs 350 for two',
//         ),
//       ],
//       [
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'Veg King',
//           desc: 'South Indian',
//           coupon: '20 \$ off | Use SWIGGYIT',
//           ratingTimePrice: '4.1 25 mins - Rs 100 for two',
//         ),
//         SpotlightBestTopFood(
//           image: 'assets/images/car.jpg',
//           name: 'Adyar Hotel',
//           desc: 'South Indian',
//           coupon: '30 \$ off | Use JUMBO',
//           ratingTimePrice: '4.3 21 mins - Rs 150 for two',
//         ),
//       ],
//     ];
//   }

//   static List<SpotlightBestTopFood> getPopularAllRestaurants() {
//     return [
//       SpotlightBestTopFood(
//         image: 'assets/images/driver.jpg',
//         name: 'Ali Kashoa',
//         desc: 'A,B,C',
//         coupon: '',
//         ratingTimePrice: '4.3/5',
//       ),
//       SpotlightBestTopFood(
//         image: 'assets/images/driver2.jpg',
//         name: 'Adyar Hotel',
//         desc: 'South Indian',
//         coupon: '30 \$ off | Use JUMBO',
//         ratingTimePrice: '4.3 21 mins - Rs 150 for two',
//       ),
//       SpotlightBestTopFood(
//         image: 'assets/images/car.jpg',
//         name: 'Chennai Mirchi',
//         desc: 'South Indian',
//         coupon: '20 \$ off | Use JUMBO',
//         ratingTimePrice: '4.1 25 mins - Rs 120 for two',
//       ),
//       SpotlightBestTopFood(
//         image: 'assets/images/car.jpg',
//         name: 'BBQ Nation',
//         desc: 'South Indian',
//         coupon: '30 \$ off | Use JUMBO',
//         ratingTimePrice: '4.3 45 mins - Rs 350 for two',
//       ),
//       SpotlightBestTopFood(
//         image: 'assets/images/car.jpg',
//         name: 'A2B Chennai',
//         desc: 'South Indian',
//         coupon: '30 \$ off | Use A2BSUPER',
//         ratingTimePrice: '4.2 32 mins - Rs 130 for two',
//       ),
//       SpotlightBestTopFood(
//         image: 'assets/images/car.jpg',
//         name: 'Dinner Expresss',
//         desc: 'North Indian',
//         coupon: '20 \$ off | Use JUMBO',
//         ratingTimePrice: '3.8 25 mins - Rs 200 for two',
//       ),
//     ];
//   }

//   static List<SpotlightBestTopFood> getTopGroceryRestaurants() {
//     return [
//       SpotlightBestTopFood(
//         image: 'assets/images/car.jpg',
//         name: 'A2B Chennai',
//         desc: 'South Indian',
//         coupon: '30 \$ off | Use A2BSUPER',
//         ratingTimePrice: '4.2 32 mins - Rs 130 for two',
//       ),
//       SpotlightBestTopFood(
//         image: 'assets/images/car.jpg',
//         name: 'Biryani Expresss',
//         desc: 'North Indian',
//         coupon: '20 \$ off | Use JUMBO',
//         ratingTimePrice: '3.8 15 mins - Rs 200 for two',
//       ),
//       SpotlightBestTopFood(
//         image: 'assets/images/car.jpg',
//         name: 'Chai Truck',
//         desc: 'Continental North Indian, South Indian',
//         coupon: '20 \$ off | Use JUMBO',
//         ratingTimePrice: '4.1 25 mins - Rs 200 for two',
//       ),
//       SpotlightBestTopFood(
//         image: 'assets/images/car.jpg',
//         name: 'Shiva Bhavan',
//         desc: 'South Indian',
//         coupon: '20 \$ off | Use SWIGGYIT',
//         ratingTimePrice: '4.1 35 mins - Rs 150 for two',
//       ),
//       SpotlightBestTopFood(
//         image: 'assets/images/car.jpg',
//         name: 'BBQ King',
//         desc: 'South Indian',
//         coupon: '20 \$ off | Use JUMBO',
//         ratingTimePrice: '4.1 25 mins - Rs 120 for two',
//       ),
//       SpotlightBestTopFood(
//         image: 'assets/images/car.jpg',
//         name: 'Pizza Corner',
//         desc: 'South Indian',
//         coupon: '30 \$ off | Use JUMBO',
//         ratingTimePrice: '4.3 47 mins - Rs 350 for two',
//       ),
//       SpotlightBestTopFood(
//         image: 'assets/images/car.jpg',
//         name: 'Veg King',
//         desc: 'South Indian',
//         coupon: '20 \$ off | Use SWIGGYIT',
//         ratingTimePrice: '4.1 25 mins - Rs 100 for two',
//       ),
//       SpotlightBestTopFood(
//         image: 'assets/images/car.jpg',
//         name: 'Adyar Hotel',
//         desc: 'South Indian',
//         coupon: '30 \$ off | Use JUMBO',
//         ratingTimePrice: '4.3 21 mins - Rs 150 for two',
//       ),
//     ];
//   }
// }


}