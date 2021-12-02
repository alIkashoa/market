import 'package:flutter/material.dart';

import 'package:swiggy_ui/user/Login_data.dart';
import 'package:swiggy_ui/utils/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartForm extends StatefulWidget {
  
   final String? cart;

 const CartForm ({ Key? key, this.cart }): super(key: key);


  @override
  _SignUpState createState() => _SignUpState(cart);
}

class _SignUpState extends State<CartForm> {
 
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? cart;
_SignUpState(String? cart){
  this.cart=cart;
}
  late String? place, adress, visa,_telephonenumber;


  @override
  void initState() {
    super.initState();

  }

  createadress() async {
    
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      
          CollectionReference users = FirebaseFirestore.instance.collection('shipment');
            users
          .add({
            'visa': visa, // John Doe
            'place': place,
            'tel': _telephonenumber, // Stokes and Sons
            'adress': adress,
            'cart':cart
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
          };
        

          // UserUpdateInfo updateuser = UserUpdateInfo();
          // updateuser.displayName = _name;
          //  user.updateProfile(updateuser);
     
        
      }
   

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
       SizedBox(
         height: 60,
       ),
       Center(child: Text("Register",style: TextStyle(color: darkOrange,fontSize: 35,fontWeight:FontWeight.bold,),)),
       SizedBox(
         height: 20,
       ),
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: TextFormField(
                          validator: (input) {
                            if (input!.isEmpty) return 'Enter place';
                          },
                          decoration: InputDecoration(
                            labelText: 'place',
                            prefixIcon: Icon(Icons.person),
                          ),
                          onSaved: (input) => place = input),
                    ),
               
                      Container(
                      child: TextFormField(
                          validator: (input) {
                            if (input!.isEmpty) return 'Enter telephonenumber ';
                          },
                          decoration: InputDecoration(
                            labelText: 'telephonenumber',
                            prefixIcon: Icon(Icons.phone),
                          ),
                          onSaved: (input) => _telephonenumber = input),
                    ),
                
                    Container(
                      child: TextFormField(
                          validator: (input) {
                            if (input!.isEmpty) return 'Enter youre adress';
                          },
                          decoration: InputDecoration(
                              labelText: 'adress',
                              prefixIcon: Icon(Icons.email)),
                          onSaved: (input) => adress = input),
                    ),
                    Container(
                      child: TextFormField(
                          validator: (input) {
                            if (input!.length < 6)
                              return 'Enter youre card number';
                          },
                          decoration: InputDecoration(
                            labelText: 'card',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          onSaved: (input) => visa = input),
                    ),
                       
                    SizedBox(height: 20),
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      onPressed: (){
                        createadress();
                        Navigator.pop(context);
                      },
                      child: Text('SignUp',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      color: darkOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
