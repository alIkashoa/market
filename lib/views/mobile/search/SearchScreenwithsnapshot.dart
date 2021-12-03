import 'package:flutter/material.dart';
import 'package:swiggy_ui/models/spotlight_best_top_food.dart';
import 'package:swiggy_ui/widgets/mobile/search_food_list_item_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:swiggy_ui/models/user.dart';


FirebaseFirestore firestore = FirebaseFirestore.instance;
class _SearchListView extends StatelessWidget {

final Stream<QuerySnapshot> snapshott ;
 
_SearchListView(this.snapshott);

  @override
  Widget build(BuildContext context) {
       return Flexible(child:
StreamBuilder(
  
stream:snapshott,
builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
if(!snapshot.hasData){
  //String x =  snapshot.data!.docs.length.toString();
return  Text(('no metching Results'),style: TextStyle(fontSize: 30));
}
return 
 ListView.builder(
   
      shrinkWrap: true,
      itemCount: snapshot.data!.docs.length,
      itemBuilder: (context, index) => SearchFoodListItemView(
        

        food:   new SpotlightBestTopFood(

        image : snapshot.data!.docs[index].data()["imagePath"],
        name:snapshot.data!.docs[index].data()["name"],
        desc:snapshot.data!.docs[index].data()["about"].substring(0,10)+"...",
        coupon:snapshot.data!.docs[index].data()["license"],
        ratingTimePrice:snapshot.data!.docs[index].data()["rating"].toString(),
        usr: new Users(imagePath: "", name: "", email: "", about: "", license: "", age: "", sex: "", carPath: "", xp: "", region: "", students: "", totalstudents: "", rating: "", phoneNumber: "")


        ),
      ),
    );


},



    
  

    ));

    
  }
}
