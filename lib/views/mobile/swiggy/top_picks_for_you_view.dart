import 'package:flutter/material.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/views/mobile/swiggy/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swiggy_ui/models/user.dart';

class TopPicksForYouView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.thumb_up, size: 20.0),
              UIHelper.horizontalSpaceSmall(),
              Text( 
                'الافضل اختيارا لك',
                style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 20.0),
              )
            ],
          ),
          UIHelper.verticalSpaceLarge(),

   LimitedBox(
         maxHeight: 188.0,
         child:
StreamBuilder(
  
stream:FirebaseFirestore.instance.collection("teacher").limit(10).snapshots(),
builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
if(!snapshot.hasData){
  //String x =  snapshot.data!.docs.length.toString();
return  Text(('no metching Results'),style: TextStyle(fontSize: 30));
}
return  ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => profile(
         new Users(
        imagePath: snapshot.data!.docs[index].data()["imagePath"].toString() , 
        name: snapshot.data!.docs[index].data()["name"].toString(),
        email: "",
        about: snapshot.data!.docs[index].data()["about"].toString(),
        license: "",
        age: "",
        sex: "",
       carPath: "",
       xp: "",
       region: snapshot.data!.docs[index].data()["region"] .toString(),
       students: "" ,
       totalstudents: "",
       rating: "" ,
       phoneNumber: "")

        )),
                    
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width: 100.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.0,
                            )
                          ],
                        ),
                        child: Image.network(
                        snapshot.data!.docs[index].data()["imagePath"],
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      UIHelper.verticalSpaceSmall(),
                      Flexible(
                            child: Align( alignment: Alignment.centerRight,child:  Text(
                          snapshot.data!.docs[index].data()["name"],
                          maxLines: 2,
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w900,
                                
                              ), 
                              textDirection: TextDirection.rtl, 
                        ))
                      ),
                      UIHelper.verticalSpaceExtraSmall(),
                       Align( alignment: Alignment.centerRight,child:   Text(
                        snapshot.data!.docs[index].data()["rating"].toString(),
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.grey[700],
                              fontSize: 13.0,
                            ),
                      ))
                    ],
                  ),
                ),
              ),
            );


},



    
  

    ))





        ],
      ),
    );
  }
}
