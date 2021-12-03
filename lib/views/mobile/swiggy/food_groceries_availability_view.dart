import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swiggy_ui/utils/app_colors.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/widgets/responsive.dart';
import 'genie/genie_grocery_card_view.dart';
import 'package:swiggy_ui/views/mobile/search/search_screen.dart';

class FoodGroceriesAvailabilityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Column(
        children: <Widget>[
   
          if (!isTabletDesktop) UIHelper.verticalSpaceLarge(),
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: InkWell(
                  child: Container(
                    height: 150.0,
                    color: swiggyOrange,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: FractionallySizedBox(
                            widthFactor: 0.7,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    globalname,
                                    style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
                                  ),
                                  UIHelper.verticalSpaceExtraSmall(),
                                  Text(
                                    '',
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 45.0,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          color: darkOrange,
                          child: Row(
                            children: <Widget>[
                              InkWell(child:
                              Text(
                                'انظر الجميع',
                                style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white, fontSize: 18.0),
                              ),onTap: (){
                                              Navigator.push(
                            context,
                            MaterialPageRoute(
                  

                              builder: (context) => SearchScreen(FirebaseFirestore.instance.collection("teacher").snapshots()),
                            ),
                          );        
                              },),
                              UIHelper.horizontalSpaceSmall(),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 18.0,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: isTabletDesktop
                      ? () {}
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchScreen(FirebaseFirestore.instance.collection("teacher").snapshots()),
                            ),
                          );
                        },
                ),
              ),
              Positioned(
                top: -10.0,
                right: -10.0,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/sign.png',
                    width: 130.0,
                    height: 130.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          UIHelper.verticalSpaceMedium(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GenieGroceryCardView(
                title: 'الافصل تقييما',
                subtitle: '',
                image: 'assets/images/bestrated.jpg',
                onTap: isTabletDesktop
                    ? () {}
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(FirebaseFirestore.instance.collection("teacher").snapshots()),
                          ),
                        );
                      },
              ),
              GenieGroceryCardView(
                title: 'الاكثر مبيعات',
                subtitle: ' ',
                image: 'assets/images/old.jpeg',
                onTap: isTabletDesktop
                    ? () {}
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(FirebaseFirestore.instance.collection("teacher").snapshots()),
                          ),
                        );
                      },
              ),
              GenieGroceryCardView(
                title: 'الافضل زبائن',
                subtitle: '',
                image: 'assets/images/eco.jpg',
                onTap: isTabletDesktop
                    ? () {}
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(FirebaseFirestore.instance.collection("teacher").snapshots()),
                          ),
                        );
                      },
              ),
            ],
          )
        ],
      ),
    );
  }
}
