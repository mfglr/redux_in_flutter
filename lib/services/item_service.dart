import 'dart:convert';

import 'package:http/http.dart' as http;

class ItemService{
  final url = "https://jsonplaceholder.typicode.com/users";

  Future<List<String>> getItems(){
    return http
      .get(Uri.parse(url))
      .then((response) => (json.decode(response.body) as List))
      .then((list) => list.map((e) => (e as Map<String,dynamic>)))
      .then((items) => items.map((item) => (item["name"] as String )).toList());
  }
}