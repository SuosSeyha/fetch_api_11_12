import 'package:flutter/material.dart';
import 'package:flutter_fetch_api_11_12/model/new_res_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class NewsService{
  Future<NewSResModel> fetchNewsAPI()async{
    var url = Uri.parse("https://newsdata.io/api/1/news?apikey=pub_1039414e72aed7a48e06887ba7e7339b28f62");
    final respone = await http.get(url);
    if(respone.statusCode ==200){
      debugPrint(' Successful...');
    }
    return json.decode(respone.body);
  }
}