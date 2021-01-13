import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_screen.dart';

var _items = ['eg', 'us', 'in', 'GB', 'it'];

class ChangeCountry extends StatefulWidget {
  @override
  _ChangeCountryState createState() => _ChangeCountryState();
}

class _ChangeCountryState extends State<ChangeCountry> {
  static String dropdownValue = 'eg';

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          Text(
            "$dropdownValue",
            style: TextStyle(color: Colors.lightBlue[900]),
          ),
          PopupMenuButton(
            icon: Icon(
              CupertinoIcons.ellipsis_vertical,
              color: Colors.lightBlue[900],
            ),
            initialValue: dropdownValue,
            itemBuilder: (context) {
              // ignore: non_constant_identifier_names
              return _items.map((Value) {
                return PopupMenuItem(value: Value, child: Text(Value));
              }).toList();
            },
            onSelected: (selectedValue) async {
              setState(() {
                dropdownValue = selectedValue;
              });

              await Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => HomeScreen(
                      country: dropdownValue,
                    ),
                  )).then((value) {
                if (mounted)
                  setState(() {
                    dropdownValue = value;
                  });
              });
              // setState(() {
              //
              //   dropdownValue=result;
              // });
            },
            onCanceled: () {},
          ),
        ],
      ),
    );
  }
}
