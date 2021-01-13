import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newApp/Model/NewsUS.dart';
import 'package:newApp/Network/WebService.dart';
import 'package:newApp/UI/HomeScreen/build_list_tile.dart';
import 'package:newApp/UI/SecondScreen/details_screen.dart';

class HomeScreenBody extends StatefulWidget {
final int selectedCategory;
final String country;
HomeScreenBody({this.selectedCategory,this.country});
  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  List<Articles> articles = List<Articles>();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: WebService().loadData(widget.selectedCategory,widget.country),
      builder:(context, snapshot) {
        if(snapshot.connectionState ==ConnectionState.done)
        {articles = snapshot.data;
          return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding:EdgeInsets.symmetric(vertical:2),
                  child: GestureDetector(
                    child: BuildListTile(index: index,articles: articles,country: widget.country,),
                    onTap: (){

                      Navigator.push(context, CupertinoPageRoute(
                        builder: (context) => DetailsScreen(number: index,articles:articles,country: widget.country,),));
                    },

                  ),
                ),
                Divider(
                  thickness: 1,
                ),
              ],
            );
          },
        );

          }
        else
          return Center(child: CircularProgressIndicator());
      }
    );
  }
}
