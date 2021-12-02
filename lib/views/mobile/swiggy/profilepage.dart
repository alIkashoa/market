import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swiggy_ui/models/user.dart';
import 'package:swiggy_ui/views/mobile/swiggy/widget/button_widget.dart';
import 'package:swiggy_ui/views/mobile/swiggy/widget/numbers_widget.dart';
import 'package:swiggy_ui/views/mobile/swiggy/widget/profile_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import '/model/user.dart';
// import '/widget/button_widget.dart';
// import '/widget/numbers_widget.dart';
// import '/widget/profile_widget.dart';

 final FirebaseAuth _auth = FirebaseAuth.instance;
late String? _data;
late String? _dataa;
addmarket() async {
    String mail ="";
    if(_auth.currentUser!=null)
             mail =_auth.currentUser!.email;

  print("using");
  print(_data);
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseFirestore.instance
    .collection('users')
    .where("email",isEqualTo: mail)
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
            print(doc.id);


for (var item in doc["markets"].split(" ")) {
  print(
    item
  );
  if (item==_data) {
    print("data is used");
    
    return;
    
  }
}




            users
    .doc(doc.id)
    .set({
      'markets': doc["markets"]+" "+_data,
      'email': doc["email"],
      'name': doc["name"],
      'tel': doc["tel"],
      'cart': doc["cart"] ,
      'prd':doc["prd"]
    })
    .then((value) => print("User Added"))
    .catchError((error) => print("Failed to add user: $error"));
        });
    });}


addtocart() async {
    String mail ="";
    if(_auth.currentUser!=null)
             mail =_auth.currentUser!.email;

  print("using");
  print(_dataa);
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseFirestore.instance
    .collection('users')
    .where("email",isEqualTo: mail)
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
            print(doc.id);


for (var item in doc["cart"].split("`")) {
  print(
    item
  );
  if (item==_dataa) {
    print("data is used");
    
    return;
    
  }
}




            users
    .doc(doc.id)
    .set({
      'markets': doc["markets"],
      'email': doc["email"],
      'name': doc["name"],
      'tel': doc["tel"],
      'cart' : doc["cart"]+"`"+_dataa,
      'prd':doc["prd"]
    })
    .then((value) => print("User Added"))
    .catchError((error) => print("Failed to add user: $error"));
        });
    });}


class FoodProfile extends StatelessWidget {
  
  
    final Users user;
    const FoodProfile(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
          
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 24),
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: (){
              
          
            },
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton(context)),
          const SizedBox(height: 24),
         
          buildAbout2(user),
        ],
      ),
    );
  
  }

  Widget buildUpgradeButton(context,) => ButtonWidget(
       
        text: 'اضف الى السلة',
        
        onClicked: () {

          _dataa = user.about +" "+ user.region +" "+ user.imagePath;
              showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('succes'),
          content: const Text('the market added succesfuly'),
          actions: <Widget>[         
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
            );
            addtocart();
        },
      );


  }



class profile extends StatelessWidget {
  
  
    final Users user;
    const profile(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
          
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 24),
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: (){
              
          
            },
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton(context)),
          const SizedBox(height: 24),
         
          buildAbout(user),
        ],
      ),
    );
  
  }

  Widget buildUpgradeButton(context,) => ButtonWidget(
       
        text: 'اضف الى القائمة',
        onClicked: () {

          _data = user.name;
              showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('succes'),
          content: const Text('the market added succesfuly'),
          actions: <Widget>[
         
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
            );
            addmarket();
        },
      );


  }

class buildName extends StatelessWidget {
 
final Users user;
const buildName(this.user);
  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}

class buildAbout2 extends StatelessWidget {

final Users user;
const buildAbout2(this.user);
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(child: 
            Text(
              'المنتج',
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),width: MediaQuery.of(context).size.width),
          
            Container(child: 
            Text(
              this.user.about,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 16, height: 1.4),
            ), width: MediaQuery.of(context).size.width),




  const SizedBox(height: 16),



 Container(child: 
            Text(
              'السعر',
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),width: MediaQuery.of(context).size.width),
      
            Container(child: 
            Text(
              this.user.region,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 16, height: 1.4),
            ), width: MediaQuery.of(context).size.width),





  const SizedBox(height: 16),
























          ],
        ),
      );
  }
}

class buildAbout extends StatelessWidget {

final Users user;
const buildAbout(this.user);
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(child: 
            Text(
              'نبذة',
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),width: MediaQuery.of(context).size.width),
          
            Container(child: 
            Text(
              this.user.about,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 16, height: 1.4),
            ), width: MediaQuery.of(context).size.width),




  const SizedBox(height: 16),



 Container(child: 
            Text(
              'المنطقة',
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),width: MediaQuery.of(context).size.width),
      
            Container(child: 
            Text(
              this.user.region,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 16, height: 1.4),
            ), width: MediaQuery.of(context).size.width),





  const SizedBox(height: 16),
























          ],
        ),
      );
  }
}