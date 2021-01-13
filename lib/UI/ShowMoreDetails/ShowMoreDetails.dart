import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class ShowMoreDetails extends StatefulWidget {
  final url;


   ShowMoreDetails({Key key, this.url}) : super(key: key);

  @override
  _ShowMoreDetailsState createState() => _ShowMoreDetailsState();
}

class _ShowMoreDetailsState extends State<ShowMoreDetails> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(Platform.isAndroid)WebView.platform=SurfaceAndroidWebView();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          "Details",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
      ),

      body:WebView(


        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,



      ),

    );
  }
}
