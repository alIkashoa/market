import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

 final FirebaseAuth _auth = FirebaseAuth.instance;
late String? _data;
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
    });
  }
class Alerts extends StatelessWidget{

  
  Widget build(BuildContext context) => new AlertDialog(

    
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(25),
      ),
    ),
    title:Text("this data is used before"),
  );
  }
  class Alert extends StatelessWidget{

  
  Widget build(BuildContext context) => new AlertDialog(

    
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(25),
      ),
    ),
    title:
    Column(children: [
    Container(
                      child: TextFormField(
                          validator: (input) {
                            if (input!.isEmpty) return 'Enter Name';
                          },
                          decoration: InputDecoration(
                            labelText: 'Name',
                            prefixIcon: Icon(Icons.person),
                          ),
                          onChanged: (input) => {_data=input}),

                    ),
ElevatedButton(
  onPressed: () {
    // Validate returns true if the form is valid, or false otherwise.
addmarket();
Navigator.pop(context);
  },
  child: const Text('Submit'),
),])
  );

  

}