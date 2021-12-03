import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swiggy_ui/user/Login_data.dart';
import 'package:swiggy_ui/utils/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String? _name, _email, _password,_familyname,_telephonenumber,_password2;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  signUp() async {
    
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
if(!(_password==_password2)){
 showError("password doesent math");


}else{
      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        if (user != null) {
          setState(() {
            isLoggedin = true;
            userName ="Hello";
            email= _auth.currentUser.email;
          CollectionReference users = FirebaseFirestore.instance.collection('users');
            users
          .add({
            'family': _familyname, // John Doe
            'name': _name,
            'tel': _telephonenumber, // Stokes and Sons
            'email': _email,
            'markets': "", // 42
            'cart': "" ,
            'prd':""
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
          });
        

          // UserUpdateInfo updateuser = UserUpdateInfo();
          // updateuser.displayName = _name;
          //  user.updateProfile(updateuser);
          await _auth.currentUser.updateProfile(displayName: _name);
          // await Navigator.pushReplacementNamed(context,"/") ;

        }
      } catch (e) {
        showError(e.toString());
        print(e);
      }
    }
  }}

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
       Center(child: Text("انشاء حساب",style: TextStyle(color: darkOrange,fontSize: 35,fontWeight:FontWeight.bold,),)),
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
                            if (input!.isEmpty) return 'Enter Name';
                          },
                          decoration: InputDecoration(
                            labelText: 'Name',
                            prefixIcon: Icon(Icons.person),
                          ),
                          onSaved: (input) => _name = input),
                    ),
                   
                      Container(
                      child: TextFormField(
                          validator: (input) {
                            if (input!.isEmpty) return 'Enter family name';
                          },
                          decoration: InputDecoration(
                            labelText: 'family',
                            prefixIcon: Icon(Icons.person_add_alt),
                          ),
                          onSaved: (input) => _familyname = input),
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
                            if (input!.isEmpty) return 'Enter Email';
                          },
                          decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email)),
                          onSaved: (input) => _email = input),
                    ),
                    Container(
                      child: TextFormField(
                          validator: (input) {
                            if (input!.length < 6)
                              return 'Provide Minimum 6 Character';
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                          onSaved: (input) => _password = input),
                    ),
                       Container(
                      child: TextFormField(
                          validator: (input) {
                            if (input!.length < 6)
                              return 'passwords doesnt match';
                          },
                          decoration: InputDecoration(
                            labelText: 'confirm password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                          onSaved: (input) => _password2 = input),
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      onPressed: signUp,
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
