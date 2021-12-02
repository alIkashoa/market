import 'package:flutter/material.dart';
import 'package:swiggy_ui/utils/app_colors.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/widgets/custom_divider_view.dart';
import 'package:swiggy_ui/widgets/veg_badge_view.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
//import 'package:swiggy_ui/views/mobile/search/search_screen.dart';
import 'package:swiggy_ui/widgets/custom_divider_view.dart';
import 'package:swiggy_ui/widgets/responsive.dart';
import 'package:swiggy_ui/user/Login_data.dart';
import 'package:swiggy_ui/models/spotlight_best_top_food.dart';
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
import 'package:swiggy_ui/widgets/mobile/search_food_list_item_view.dart';
// import 'in_the_spotlight_view.dart';
// import 'indian_food/indian_food_view.dart';

// import 'popular_brand_view.dart';
// import 'popular_categories_view.dart';
// import 'restaurants/restaurant_vertical_list_view.dart';

//import 'top_offer_view.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;
class BillScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
      String mail ="";
    if(_auth.currentUser!=null)
             mail =_auth.currentUser!.email;
    return 
    
    Column(
      children: [
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

// print(snapshot.data!.docs[0].data()["cart"].split("`")[0]);
//  print(snapshot.data!.docs[0].data()["cart"].split("`")[0].split(" ")[0]);
// print(snapshot.data!.docs[0].data()["cart"].split("`")[0].split(" ")[0]);
// print(snapshot.data!.docs[0].data()["cart"].split("`")[0].split(" ")[0]);

int? l=0;
String markets ="";
if(snapshot.data!.docs[0].data()["prd"].startsWith("`")){
 markets =(snapshot.data!.docs[0].data()["prd"]).substring(1);
  l =snapshot.data!.docs[0].data()["prd"].split("`").length-1;
}else{
 markets =(snapshot.data!.docs[0].data()["prd"]);
  l =snapshot.data!.docs[0].data()["prd"].split("`").length;
}
if(markets=="")
return Text("Nothing added to bills");

return  ListView.builder(
   
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: l,
      itemBuilder: (context, index) => 
      
      
      // Text(
      //   (markets.split("`")[index].split(" ")[2])
      //   )
        SearchFoodListItemView2(
        food:   new SpotlightBestTopFood(
        image :    markets.split("`")[index].split(" ")[2],
        name:markets.split("`")[index].split(" ")[0],
        desc:markets.split("`")[index].split(" ")[1],
        coupon:"",
        ratingTimePrice:"",
        usr: new Users(
        imagePath: markets.split("`")[index].split(" ")[2], 
        name: "",
        email: "",
        about: markets.split("`")[index].split(" ")[0],
        license: "" ,
        age: "",
        sex: "",
       carPath: "",
       xp: "",
       region: markets.split("`")[index].split(" ")[1],
       students: "" ,
       totalstudents: "" ,
       rating: "" ,
       phoneNumber: "",)

        

        ),
      
      
 )
   
//       SearchFoodListItemView(
        


//         food:   new SpotlightBestTopFood(
//         image : items![index].split(" ")[2],
//         name:items[index].split(" ")[0],
//         desc: items[index].split(" ")[1],
//         coupon:snapshot.data!.docs[index].data()["license"],
//         ratingTimePrice:snapshot.data!.docs[index].data()["rating"].toString(),
//         usr: new Users(
//         imagePath: snapshot.data!.docs[index].data()["imagePath"].toString() , 
//         name: snapshot.data!.docs[index].data()["name"].toString(),
//         email: snapshot.data!.docs[index].data()["email"].toString(),
//         about: snapshot.data!.docs[index].data()["about"].toString(),
//         license: snapshot.data!.docs[index].data()["license"].toString() ,
//         age: snapshot.data!.docs[index].data()["age"].toString(),
//         sex: snapshot.data!.docs[index].data()["sex"].toString(),
//        carPath: snapshot.data!.docs[index].data()["carPath"].toString(),
//        xp: snapshot.data!.docs[index].data()["xp"].toString(),
//        region: snapshot.data!.docs[index].data()["region"] .toString(),
//        students: snapshot.data!.docs[index].data()["students"].toString() ,
//        totalstudents: snapshot.data!.docs[index].data()["totalstudents"].toString() ,
//        rating: snapshot.data!.docs[index].data()["rating"].toString() ,
//        phoneNumber: snapshot.data!.docs[index].data()["phoneNumber"].toString(),)

        

//         ),
      
      
//  )
);

                       }
                       ),)
                       
       
                       ]);

  }
}