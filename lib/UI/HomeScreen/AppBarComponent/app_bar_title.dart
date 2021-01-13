import 'package:flutter/material.dart';

DateTime date =DateTime.now();
class AppBarTitle extends StatefulWidget {
  final double height;
  AppBarTitle({this.height})  ;

  @override
  _AppBarTitleState createState() => _AppBarTitleState();
}

class _AppBarTitleState extends State<AppBarTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.only(top :10.0),
      child: Column(

        children: [
          RichText(
            text: TextSpan(text: "News",
                style: TextStyle(
                    color: Colors.lightBlue[900],
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
                children: [
                  TextSpan(text:" Today",
                    style: TextStyle(
                        color: Colors.lightBlue[200],
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),

                  )
                ]),
          ),
          Text("${date.year}-${date.month}-${date.day}",
            style: TextStyle(
              color: Colors.blueGrey[200],
              fontSize: 14,

            ),)
        ],
      ),
    );
  }
}