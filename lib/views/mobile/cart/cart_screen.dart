import 'package:flutter/material.dart';
import 'package:swiggy_ui/utils/app_colors.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/user/Login_data.dart';
import 'package:swiggy_ui/models/spotlight_best_top_food.dart';
import 'package:swiggy_ui/models/user.dart';
import 'package:swiggy_ui/widgets/mobile/search_food_list_item_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'CartForm.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;
class CartScreen extends StatelessWidget {
 
clearcart() async {
    String mail ="";
    if(_auth.currentUser!=null)
             mail =_auth.currentUser!.email;

  print("using");

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseFirestore.instance
    .collection('users')
    .where("email",isEqualTo: mail)
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
            print(doc.id);

            users
    .doc(doc.id)
    .set({
      'markets': doc["markets"],
      'email': doc["email"],
      'name': doc["name"],
      'tel': doc["tel"],
      'cart' : "",
      'prd':doc["prd"]
    })
    .then((value) => print("User Added"))
    .catchError((error) => print("Failed to add user: $error"));
        });
    });}






buycart() async {
    String mail ="";
    if(_auth.currentUser!=null)
             mail =_auth.currentUser!.email;

  print("using");

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseFirestore.instance
    .collection('users')
    .where("email",isEqualTo: mail)
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
            print(doc.id);

            users
    .doc(doc.id)
    .set({
      'markets': doc["markets"],
      'email': doc["email"],
      'name': doc["name"],
      'tel': doc["tel"],
      'cart' : "",
      'prd':doc["prd"]+doc["cart"]
    })
    .then((value) => print("User Added"))
    .catchError((error) => print("Failed to add user: $error"));
        });
    });}

    
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
              Icon(Icons.shopping_basket_outlined, size: 30.0),
              UIHelper.horizontalSpaceSmall(),
              Text(
                'My Cart',
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
if(snapshot.data!.docs[0].data()["cart"].startsWith("`")){
 markets =(snapshot.data!.docs[0].data()["cart"]).substring(1);
  l =snapshot.data!.docs[0].data()["cart"].split("`").length-1;
}else{
 markets =(snapshot.data!.docs[0].data()["cart"]);
  l =snapshot.data!.docs[0].data()["cart"].split("`").length;
}
if(markets=="")
return Text("Nothing added to cart");
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
   );

                       }
                       ),)
                       
     ,Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      height: 50.0,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: darkOrange),
        child: Text(
          'clear the cart',
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(color: Colors.white, fontSize: 19.0),
        ),
        onPressed: () {
                 clearcart();    
              },
      ),
    ),Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      height: 50.0,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: darkOrange),
        child: Text(
          'Buy all my Products',
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(color: Colors.white, fontSize: 19.0),
        ),
        onPressed: 
             () {
                  String mail ="";
                  String cart ="";
    if(_auth.currentUser!=null)
             mail =_auth.currentUser!.email;

  print("using");

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseFirestore.instance
    .collection('users')
    .where("email",isEqualTo: mail)
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
cart=doc["cart"];
        }
    );});
    
               Navigator.push(context, 
            MaterialPageRoute(builder: (context) => CartForm(cart:cart ,)));
            buycart();
          
              },
      ),
    )                  
                       
                       ]);

  }
}
