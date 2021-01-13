import 'package:flutter/material.dart';
import 'package:newApp/UI/HomeScreen/home_screen.dart';


void main(){
  runApp(NewsApp());




}
class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Today',
      theme: ThemeData(
        backgroundColor: Colors.white70,
        visualDensity: VisualDensity.adaptivePlatformDensity,


      ),
      debugShowCheckedModeBanner: false,
      home:SafeArea(child: HomeScreen( )) ,
      

    );
  }
}
