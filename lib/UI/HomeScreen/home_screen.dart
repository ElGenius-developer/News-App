import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newApp/UI/HomeScreen/categories_bar.dart';
import 'package:newApp/UI/HomeScreen/home_app_bar.dart';
import 'home_screen_body.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  int index;
  String country;
  HomeScreen({this.index, this.country});

  @override
  Widget build(BuildContext context) {
    if (index == null) {
      index = 0;
    }
    if (country == null) {
      country = 'eg';
    }

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: homeAppBar(),
      body: OrientationBuilder(builder: (context, orientation) {
        double divideHeight=1;
        if (orientation == Orientation.portrait) {
          divideHeight=7.5;
        } else {
          divideHeight=4;
        }
        return Column(
          children: [
            Container(
              height: height / divideHeight,
              padding: EdgeInsets.symmetric(horizontal: width / 12),
              child: CategoriesBar(
                selectedItem: index,
                country: country,
              ),
            ),
            Divider(
              thickness: .3,
            ),
            Expanded(
                child: HomeScreenBody(
                  selectedCategory: index,
                  country: country,
                )),
          ],
        );
      }),
    );
  }
}
