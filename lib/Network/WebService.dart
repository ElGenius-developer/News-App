import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newApp/LocalData/data/CategoriesData.dart';
import 'package:newApp/Model/NewsUS.dart';


class WebService{
  // String category='business';
// ignore: non_constant_identifier_names
Future<List<Articles>> loadData  (int CategoryNumber, String country ) async {
  if(country==null)
    {
      country='eg';
    }
  String url='http://newsapi.org/v2/top-headlines?country=$country&category='
      '${categoryName[CategoryNumber]}&apiKey=6fae172eac75475489122b9262aa1b9c';
  final response = await http.get(url);
if(response.statusCode ==200||response.statusCode==201 )
  {
    final jsonData =jsonDecode(response.body);
    final List list = jsonData['articles'];

    return  list.map((element) => Articles.fromJson(element)).toList();

  }
else{
  print('$country \n ');

  throw Exception("Cannot load news");

}

}



}