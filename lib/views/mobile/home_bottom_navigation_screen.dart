import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swiggy_ui/views/mobile/search/search_screen.dart';
import 'package:swiggy_ui/views/mobile/swiggy/swiggy_screen.dart';
import 'package:swiggy_ui/views/mobile/search/search.dart';
import '../../utils/app_colors.dart';
import 'account/account_screen.dart';
import 'cart/cart_screen.dart';
import 'package:swiggy_ui/user/Login_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'alert.dart';
import 'cart/bils.dart';


//This widget is the main widget.


//Initial widget
class InitalScreenWidget extends StatefulWidget{
  // InitialScreenWidget({Key key}) : super(key: key);

  @override
  HomeWidget createState() => HomeWidget();
    
}

//State<StatefulWidget> action method
class HomeWidget extends State<InitalScreenWidget>{
  int _count = 0;
  Color? _iconPressed1 = swiggyOrange;
  Color? _iconPressed2 = Colors.black;
  Color? _iconPressed3 = Colors.black;
  Color? _iconPressed4 = Colors.black;

  //Page controller
  PageController _navPage = PageController(initialPage: 0);

  Widget build(BuildContext ctx){
    return Scaffold(
       
        body: PageView(
          controller: _navPage,
          onPageChanged: (int){
            print('Page changes to index $int');
          },
          children: <Widget>[
           SwiggyScreen(),
           SearchScreen(FirebaseFirestore.instance.collection("teacher").snapshots()),
           CartScreen(),
          BillScreen()
           
          ],
          // physics: NeverScrollableScrollPhysics(), //to disable Swipe
        ),
      
        backgroundColor: Color(0xFFFFFCFC), //white ivory
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          
          child: Container(
            height: 60.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  iconSize: 35,
                  padding: EdgeInsets.only(left: 28.0),
                  icon: Icon(Icons.home_outlined, color: (_iconPressed1)), 
                  onPressed: () { 
                    setState(() {
                      _navPage.jumpToPage(0);
                    _iconPressed1 = swiggyOrange;
                    _iconPressed2 = Colors.black;
                    _iconPressed3 = Colors.black;
                    _iconPressed4 = Colors.black;
                  });}),
                IconButton(
                  iconSize: 35,
                  icon: Icon(Icons.search,color: _iconPressed2,), 
                  onPressed: () { 
                    setState(() {
                      _navPage.jumpToPage(1);
                      _iconPressed1 = Colors.black;
                    _iconPressed2 = swiggyOrange;
                    _iconPressed3 = Colors.black;
                    _iconPressed4 = Colors.black;
                  });}),
                IconButton(
                  iconSize: 35,
                  icon: Icon(Icons.shopping_cart_outlined,color: _iconPressed3,), 
                  onPressed: () { 
                    setState(() {
                      _navPage.jumpToPage(2);
                    _iconPressed1 = Colors.black;
                    _iconPressed2 = Colors.black;
                    _iconPressed3 = swiggyOrange;
                    _iconPressed4 = Colors.black;
                  });}),
                IconButton(
                  iconSize: 35,
                  padding: EdgeInsets.only(right: 28.0),
                  icon: Icon(Icons.account_balance_wallet_outlined,color: _iconPressed4,), 
                  onPressed: () { 
                    setState(() {
                      _navPage.jumpToPage(3);
                         _iconPressed1 = Colors.black;
                    _iconPressed2 = Colors.black;
                    _iconPressed3 = Colors.black;
                    _iconPressed4 = swiggyOrange;
                  });}),
                
              ],
            ),
            ),
        ),
        
        floatingActionButton: FloatingActionButton(
          backgroundColor: swiggyOrange, 
          onPressed: () {
            showDialog(context: context,
            builder: (BuildContext context){
              return Alert();
            },);
          },
          // onPressed: () => setState(() {
          //   _count++;
          //   print('You like Indonesia $_count time(s)');
            
          // }),
          child: const Icon(Icons.add,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        
    );
  }

 
} //Toast function
 

