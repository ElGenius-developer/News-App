import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:newApp/LocalData/data/CategoriesData.dart';
import 'package:newApp/LocalData/methods/CircularAvatar.dart';
import 'package:newApp/UI/HomeScreen/home_screen.dart';

 // ignore: must_be_immutable
 class CategoriesBar extends StatefulWidget {
  int selectedItem;
  String country;
  CategoriesBar({Key key, this.selectedItem, this.country}) : super(key: key);

  @override
  _CategoriesBarState createState() => _CategoriesBarState();
}

class _CategoriesBarState extends State<CategoriesBar> {


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,

        children: [
          Expanded(
            child: ListView.builder(
              itemCount: urls.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                child: (createCircularAvatar(
                  index: index,
                  context: context,
                  selectedItem: widget.selectedItem,
                  country: widget.country,
                )),
                onTap: () async {
                  final result = await Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => HomeScreen(
                          index: index,
                          country: widget.country,
                        ),
                        maintainState: true,
                        fullscreenDialog: true,
                      ));


                    widget.selectedItem = index;
                    widget.country=result;


                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
