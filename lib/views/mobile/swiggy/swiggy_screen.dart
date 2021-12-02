import 'package:flutter/material.dart';
import 'package:swiggy_ui/auth/start.dart';
import 'package:swiggy_ui/models/spotlight_best_top_food.dart';
import 'package:swiggy_ui/utils/app_colors.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
//import 'package:swiggy_ui/views/mobile/search/search_screen.dart';
import 'package:swiggy_ui/widgets/custom_divider_view.dart';
import 'package:swiggy_ui/widgets/responsive.dart';
import 'package:swiggy_ui/user/Login_data.dart';
import 'all_restaurants/all_restaurants_screen.dart';
import 'package:swiggy_ui/views/mobile/search/search_screen.dart';
import 'package:swiggy_ui/models/user.dart';
//import 'best_in_safety_view.dart';
// import 'package:flutter/material.dart';
// import 'package:swiggy_ui/models/spotlight_best_top_food.dart';
// import 'package:swiggy_ui/utils/app_colors.dart';
// import 'package:swiggy_ui/utils/ui_helper.dart';
// import 'package:swiggy_ui/widgets/custom_divider_view.dart';
import 'package:swiggy_ui/widgets/mobile/search_food_list_item_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'food_groceries_availability_view.dart';
import 'genie/genie_view.dart';
// import 'in_the_spotlight_view.dart';
// import 'indian_food/indian_food_view.dart';
import 'offers/offer_banner_view.dart';
import 'offers/offer_screen.dart';
// import 'popular_brand_view.dart';
// import 'popular_categories_view.dart';
// import 'restaurants/restaurant_vertical_list_view.dart';
import 'swiggy_safety_banner_view.dart';
//import 'top_offer_view.dart';
import 'top_picks_for_you_view.dart';



final FirebaseAuth _auth = FirebaseAuth.instance;
class SwiggyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String mail ="";
    if(_auth.currentUser!=null)
             mail =_auth.currentUser!.email;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              _buildAppBar(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      FoodGroceriesAvailabilityView(),
                       TopPicksForYouView(),
                        OfferBannerView(),
                      //  CustomDividerView(),
                      //  IndianFoodView(),
                      //  CustomDividerView(),
                      //  InTheSpotlightView(),
                      //  CustomDividerView(),
                      //  PopularBrandsView(),
                       CustomDividerView(),
                       SwiggySafetyBannerView(),
                   //    BestInSafetyViews(),
                   // CustomDividerView(),
                      //TopOffersViews(),
                      CustomDividerView(),
                      GenieView(),
                      CustomDividerView(),
                      // PopularCategoriesView(),
                       CustomDividerView(),
                        Container(
      margin: const EdgeInsets.all(15.0),
      child: 
        Row(
            children: <Widget>[
              Icon(Icons.thumb_up, size: 20.0),
              UIHelper.horizontalSpaceSmall(),
              Text(
                'your markets',
                style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 20.0),
              )
            ],
          )),
                       Flexible(child:
StreamBuilder(

stream:FirebaseFirestore.instance.collection("users").where("email", isEqualTo: mail).snapshots(),
builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
if(!snapshot.hasData){
  //String x =  snapshot.data!.docs.length.toString();
return  Text((email),style: TextStyle(fontSize: 30));
}
int? l =snapshot.data!.docs[0].data()["markets"].split(" ").length;

return 
 ListView.builder(
   
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: l,
      itemBuilder: (context, index) =>
      
   
StreamBuilder(
 
stream:FirebaseFirestore.instance.collection("teacher").where("name", isEqualTo:snapshot.data!.docs[0].data()["markets"].split(" ")[index]).snapshots(),
builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

if(!snapshot.hasData){
  //String x =  snapshot.data!.docs.length.toString();
return  Text(("please log in"),style: TextStyle(fontSize: 30));
}

int? l =snapshot.data!.docs.length;
return 
 ListView.builder(
   
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: l,
      itemBuilder: (context, index) =>
      SearchFoodListItemView(
        


        food:   new SpotlightBestTopFood(
        image : snapshot.data!.docs[index].data()["imagePath"],
        name:snapshot.data!.docs[index].data()["name"],
        desc:snapshot.data!.docs[index].data()["about"].substring(0,10)+"...",
        coupon:snapshot.data!.docs[index].data()["license"],
        ratingTimePrice:snapshot.data!.docs[index].data()["rating"].toString(),
        usr: new Users(
        imagePath: snapshot.data!.docs[index].data()["imagePath"].toString() , 
        name: snapshot.data!.docs[index].data()["name"].toString(),
        email: snapshot.data!.docs[index].data()["email"].toString(),
        about: snapshot.data!.docs[index].data()["about"].toString(),
        license: snapshot.data!.docs[index].data()["license"].toString() ,
        age: snapshot.data!.docs[index].data()["age"].toString(),
        sex: snapshot.data!.docs[index].data()["sex"].toString(),
       carPath: snapshot.data!.docs[index].data()["carPath"].toString(),
       xp: snapshot.data!.docs[index].data()["xp"].toString(),
       region: snapshot.data!.docs[index].data()["region"] .toString(),
       students: snapshot.data!.docs[index].data()["students"].toString() ,
       totalstudents: snapshot.data!.docs[index].data()["totalstudents"].toString() ,
       rating: snapshot.data!.docs[index].data()["rating"].toString() ,
       phoneNumber: snapshot.data!.docs[index].data()["phoneNumber"].toString(),)

        

        ),
      
      
 ));}));


},



    
  

    )),
                      
                      SeeAllRestaurantBtn(),
                    //  LiveForFoodView(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildAppBar(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        height: 60.0,
        child: Row(
          children: <Widget>[
                   InkWell( child:
            Text(
              userName,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontSize: 21.0),
            ),        onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Start(),
                  ),
                );
              },),
            UIHelper.horizontalSpaceExtraSmall(),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Icon(Icons.keyboard_arrow_down),
            ),
            Spacer(),
            Icon(Icons.local_offer_outlined),
            UIHelper.horizontalSpaceExtraSmall(),
            InkWell(
              child: Container(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'كيفية عمل التطبيق',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 18.0),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(

body: 
Center(child:
Column(children: [


  
Center(child: Text("contuct us under :",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),),
Center(child: Text("*******",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),),



],))


                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
}

class SeeAllRestaurantBtn extends StatelessWidget {
  const SeeAllRestaurantBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      height: 50.0,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: darkOrange),
        child: Text(
          'See all my Markets',
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(color: Colors.white, fontSize: 19.0),
        ),
        onPressed: isTabletDesktop
            ? () {}
            : () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(FirebaseFirestore.instance.collection("teacher").snapshots()),
                          ),
                        );
              },
      ),
    );
  }
}

class LiveForFoodView extends StatelessWidget {
  const LiveForFoodView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.all(15.0),
      height: 400.0,
      color: Colors.grey[200],
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'LIVE\nFOR\nFOOD',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.grey[400],
                      fontSize: 80.0,
                      letterSpacing: 0.2,
                      height: 0.8,
                    ),
              ),
              UIHelper.verticalSpaceLarge(),
              Text(
                'MADE BY FOOD LOVERS',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.grey),
              ),
              Text(
                '',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.grey),
              ),
              UIHelper.verticalSpaceExtraLarge(),
              Row(
                children: <Widget>[
                  Container(
                    height: 1.0,
                    width: MediaQuery.of(context).size.width / 4,
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          ),
          Positioned(
            left: 140.0,
            top: 90.0,
            child: Image.asset(
              'assets/images/burger.png',
              height: 80.0,
              width: 80.0,
            ),
          )
        ],
      ),
    );
  }
}
