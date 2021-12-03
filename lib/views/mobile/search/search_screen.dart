import 'package:flutter/material.dart';
import 'package:swiggy_ui/models/spotlight_best_top_food.dart';
import 'package:swiggy_ui/models/user.dart';
import 'package:swiggy_ui/utils/app_colors.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/widgets/custom_divider_view.dart';
import 'package:swiggy_ui/widgets/mobile/search_food_list_item_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;

class SearchScreen extends StatefulWidget {
  final Stream<QuerySnapshot> snapshott ;
    SearchScreen(this.snapshott);
  @override
  _SearchScreenState createState() => _SearchScreenState(snapshott);
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {
   final Stream<QuerySnapshot> snapshott ;
    _SearchScreenState(this.snapshott);
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 15.0, top: 2.0, bottom: 2.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]!),
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for the best market',
                          hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                                color: Colors.grey,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                              ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    UIHelper.horizontalSpaceMedium(),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              UIHelper.verticalSpaceExtraSmall(),
              TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                controller: _tabController,
                indicatorColor: darkOrange,
                labelStyle: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 18.0, color: darkOrange),
                unselectedLabelStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: 18.0,
                      color: Colors.grey[200],
                    ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    child: Text('المنتجالت'),
                  ),
                  Tab(
                    child: Text('المارتكتات'),
                  ),
                ],
              ),
              UIHelper.verticalSpaceSmall(),
              CustomDividerView(dividerHeight: 8.0),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _SearchListViewnosn(
                      
                    ),
                    Text(('no metching Results'),style: TextStyle(fontSize: 30)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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




        usr: new Users(
  imagePath: snapshot.data!.docs[index].data()["imagePath"].toString() , 
        name: snapshot.data!.docs[index].data()["name"].toString(),
        email: snapshot.data!.docs[index].data()["email"].toString(),
        about: snapshot.data!.docs[index].data()["about"].toString(),
        license: snapshot.data!.docs[index].data()["license"].toString() ,
        age: snapshot.data!.docs[index].data()["age"].toString(),
        sex: snapshot.data!.docs[index].data()["sex"].toString(),
       carPath: snapshot.data!.docs[index].data()["carPath"].toString(),
       xp: snapshot.data!.docs[index].data()["xp"].toString(),
       region: snapshot.data!.docs[index].data()["region"] .toString(),
       students: snapshot.data!.docs[index].data()["students"].toString() ,
       totalstudents: snapshot.data!.docs[index].data()["totalstudents"].toString() ,
       rating: snapshot.data!.docs[index].data()["rating"].toString() ,
       phoneNumber: snapshot.data!.docs[index].data()["phoneNumber"].toString())

        ),
      ),
    );


},



    
  

    ));

    
  }
}

class _SearchListViewnosn extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
       String mail ="";
    if(_auth.currentUser!=null)
             mail =_auth.currentUser!.email;

       return Flexible(child:
StreamBuilder(

stream:FirebaseFirestore.instance.collection("users").where("email", isEqualTo: mail).snapshots(),
builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
if(!snapshot.hasData){
  //String x =  snapshot.data!.docs.length.toString();
return  Text(("no shops found"),style: TextStyle(fontSize: 30));
}

String markets ="";
if(snapshot.data!.docs[0].data()["markets"].startsWith(" ")){
 markets =(snapshot.data!.docs[0].data()["markets"]).substring(1);
}else{
 markets =(snapshot.data!.docs[0].data()["markets"]);
}
int? l =markets.split(" ").length;
if(markets=="")
return Text("No markets added to the list");
return 
 ListView.builder(
   
      shrinkWrap: true,
      itemCount: l,
      itemBuilder: (context, index) =>
      
   
StreamBuilder(

stream:FirebaseFirestore.instance.collection(markets.split(" ")[index]).snapshots(),
builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

if(!snapshot.hasData){
  //String x =  snapshot.data!.docs.length.toString();
return  Text(("please log in"),style: TextStyle(fontSize: 30));
}

//print(snapshot.data!.docs[0].data()["markets"].split(" ")[0]);
print(index);
print(markets.split(" ")[index]);
int? l =snapshot.data!.docs.length;
return 
 ListView.builder(
   
  
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: l,
      itemBuilder: (context, index) =>
      SearchFoodListItemView2(
        


        food:   new SpotlightBestTopFood(
        image : snapshot.data!.docs[index].data()["imgpath"],
        name:snapshot.data!.docs[index].data()["name"],
        desc:snapshot.data!.docs[index].data()["price"],
        coupon:"",
        ratingTimePrice:"",
        usr: new Users(
        imagePath: snapshot.data!.docs[index].data()["imgpath"] , 
        name: "",
        email: "",
        about: snapshot.data!.docs[index].data()["name"],
        license: "" ,
        age: "",
        sex: "",
       carPath: "",
       xp: "",
       region: snapshot.data!.docs[index].data()["price"],
       students: "" ,
       totalstudents: "" ,
       rating: "" ,
       phoneNumber: "",)

        

        ),
      
      
 ));}));


},



    
  

    )
 );

    
  }
}

