import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newApp/Model/NewsUS.dart';

class BuildListTile extends StatelessWidget {
  final List<Articles> articles;
  final int index ;
final String country;
  const BuildListTile({Key key, this.articles, this.index,this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width/4;
    double height= MediaQuery.of(context).size.height/10;
    return  ListTile(
      title: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width/1.75,
            child: Text('${articles[index].title}',
            textDirection:(country=='eg') ?TextDirection.rtl: TextDirection.ltr ,
            maxLines: 2,
            softWrap: true,
              style: TextStyle(
                fontSize: 15,
                color: Colors.indigo[900]
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:5.0),


              child: Row(
                children: [
                  Icon(CupertinoIcons.arrow_up_right_square,size: 13,color: Colors.blueGrey),

                      FittedBox(
                        child: Text("  ${articles[index].source.name}",
                        style: TextStyle(
                        fontSize: 12,color: Colors.blueGrey

                    ),),
                      ),
                 
                ],
            ),
          )
        ],
      ),

      ////////////////////////
      trailing: (articles[index].urlToImage != null)
          ? ClipRRect(
           borderRadius: BorderRadius.circular(10),
            child: Container(
             width: width,
           height: height,


            child: Image(image: NetworkImage(articles[index].urlToImage))),
          )
          : Container(
        padding: EdgeInsets.all(6),

        height: height,
        width: width,

        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.restore,
            ),
            Text("No image"),
          ],
        ),
      ),
    );
  }
}
