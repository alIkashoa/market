import 'package:flutter/material.dart';
import 'package:swiggy_ui/user/Login_data.dart';
import 'package:swiggy_ui/utils/app_colors.dart';



class Aboutt extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Aboutt> {
 

  @override
  void initState() {
    super.initState();
  
  }

  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              child: Image(
                image: AssetImage("assets/images/login.jpg"),
                fit: BoxFit.contain,
              ),
            ),
            Center(child: Text("the application shows  the markets that you select .",style: TextStyle(fontSize: 15,),)),
            Center(child: Text("and gives you the opertunty to buy them",style: TextStyle(fontSize: 15,),)),
            Center(child: Text("using the app only in a few of minutes.",style: TextStyle(fontSize: 15,),)),
       

     ],
        ),
      ),
    ));
  }
}