import 'package:flutter/material.dart';
import 'package:swiggy_ui/models/spotlight_best_top_food.dart';
import 'package:swiggy_ui/utils/app_colors.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/widgets/custom_divider_view.dart';
import 'package:swiggy_ui/widgets/mobile/search_food_list_item_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:swiggy_ui/views/mobile/search/SearchScreenwithsnapshot.dart';
import 'package:swiggy_ui/views/mobile/search/search_screen.dart';


class search extends StatelessWidget {
  const search({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
    SizedBox(height: 50),
    Text("the perfect teacher",style: TextStyle(fontSize: 32.0, fontStyle: FontStyle.italic)
    ,),
      
      SizedBox(height: 50),
       Text("Chose youre prefered car type",style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic)),
      SizedBox(width: 25,),
     Row(
      children: [
SizedBox(width: 10,),
InkWell(child: 
Container(width:(MediaQuery. of(context). size. width /3)-17,height: 100,decoration: BoxDecoration(    border: Border.all(color: Colors.blueAccent)),

child: Column(children: [

  Center( child:Text("suv",style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic))),
  Image(image: AssetImage("assets/icons/suv.png"),height: 70,width: 70,)


],),)

,onTap: 
(){

              Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(FirebaseFirestore.instance.collection("teacher").where("type", isEqualTo: "suv").snapshots()),
                          ),
                        );
}

,
),
SizedBox(width: 10,),
InkWell(child: 
Container(width:(MediaQuery. of(context). size. width /3)-17,height: 100,decoration: BoxDecoration(    border: Border.all(color: Colors.blueAccent)),

child: Column(children: [
  Center( child:Text("classic",style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic))),
  Image(image: AssetImage("assets/icons/sedan.png"),height: 70,width: 70,)


],),)

,onTap: 
(){

              Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(FirebaseFirestore.instance.collection("teacher").where("type", isEqualTo: "norm").snapshots()),
                          ),
                        );

}

,
),
SizedBox(width: 10,),
InkWell(child: 
Container(width:(MediaQuery. of(context). size. width /3)-17,height: 100,decoration: BoxDecoration(    border: Border.all(color: Colors.blueAccent)),

child: Column(children: [
  Center( child:Text("sport",style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic))),
  Image(image: AssetImage("assets/icons/sport-car.png"),height: 70,width: 70,)


],),)

,onTap: 
(){


              Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(FirebaseFirestore.instance.collection("teacher").where("type", isEqualTo: "sport").snapshots()),
                          ),
                        );

}

,
),
SizedBox(width: 10,),

      ],
    )]);
   
  }
}
