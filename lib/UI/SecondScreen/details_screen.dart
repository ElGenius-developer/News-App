import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newApp/LocalData/methods/lunch.dart';
import 'package:newApp/Model/NewsUS.dart';

class DetailsScreen extends StatelessWidget {
  final String country;
  final int number;
  final List<Articles> articles;

  DetailsScreen({this.number, this.articles, this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          "Details",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            //title
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width - 5,
                alignment: Alignment.center,
                child: Text(
                  "${articles[number].title}",
                  textDirection: (country=='eg')?TextDirection.rtl:TextDirection.ltr,
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                )),
            //time and date
            Padding(
              padding: EdgeInsets.only(
                top: 25,
                bottom: 15,
              ),

                child: Wrap(
                    children: [
                  Text("    ${articles[number].publishedAt}",),
                  (articles[number].author != null)
                      ? Text("  by ${articles[number].author}")
                      : Text(''),
                ]),
              ),

            Padding(
              padding: EdgeInsets.only(left: 10, bottom: 20),
              child: Row(
                  children: List.generate(
                4,
                (index) => SizedBox(
                    width: 50,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Image.asset('assets/${index + 1}.png'),
                    )),
              )),
            ),
            SizedBox(
              // width: MediaQuery.of(context).size.width-20,
              child: (articles[number].urlToImage != null)
                  ? Image(image: NetworkImage(articles[number].urlToImage))
                  : Center(child: Icon(Icons.error_outline,size: 20,)),
            ),
            Wrap(children: [
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  ((articles[number].description != null)
                      ? '${articles[number].description}\n\n '
                      : ''),
                  textDirection: (country=='eg')?TextDirection.rtl:TextDirection.ltr,
                  maxLines: 10,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  textScaleFactor: 1.2,
                ),
              ),
              GestureDetector(
                child: Column(
                  children: [
                    Text(
                      'continue reading on website ......',
                      style: TextStyle(
                        color: Colors.blue[700],
                      ),
                    ),
                    Container(
                      height: 1.5,
                      width: 200,
                      color: Colors.blue[700],
                      
                    ),
                    SizedBox(
                      height: 20,
                    )

                  ],
                ),
                onTap: () => launchURL('${articles[number].url}'),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
