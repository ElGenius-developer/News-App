import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newApp/UI/HomeScreen/AppBarComponent/app_bar_title.dart';

import 'AppBarComponent/change_country.dart';

//


  Widget homeAppBar() {


    return AppBar(
      toolbarHeight: 50,
      elevation: 0,
      backgroundColor: Colors.white,
      title: AppBarTitle(height: 8,),
      
      actions: [
        Container(
        // padding: EdgeInsets.all(),
        child: Center(child: ChangeCountry()),
      )

      ],


    );
  }
