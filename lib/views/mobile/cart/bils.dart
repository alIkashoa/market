import 'package:flutter/material.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/user/Login_data.dart';
import 'package:swiggy_ui/models/spotlight_best_top_food.dart';
import 'package:swiggy_ui/models/user.dart';
import 'package:swiggy_ui/widgets/mobile/search_food_list_item_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
              Icon(Icons.money, size: 30.0),
              UIHelper.horizontalSpaceSmall(),
              Text(
                'Baught Products',
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
  
);

                       }
                       ),)
                       
       
                       ]);

  }
}