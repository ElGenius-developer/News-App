import 'package:flutter/material.dart';
import 'package:newApp/LocalData/data/CategoriesData.dart';

   createCircularAvatar  ({BuildContext context, int index , int selectedItem,String country}){

     return  Container(

     padding:   EdgeInsets.symmetric(horizontal:11.0, ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Padding(
               padding:  EdgeInsets.all(8.0),
               child: CircleAvatar(
                 backgroundImage: NetworkImage(urls[index]),
                 radius: 25,

               ),
             ),
             Padding(
               padding:  EdgeInsets.symmetric(vertical:(country=='eg')?0: 2),
               child: (country=='eg')?
                   Text('${categoryNameEg[index]}'):Text('${categoryName[index]}',
                 style: TextStyle(
                   color:(selectedItem==index)? Colors.black: Colors.black54,
                   fontSize: MediaQuery.of(context).size.width/36,
                   fontWeight: FontWeight.bold,
                 ),),
             )
           ],
         ),


     );


   }
