import 'package:bloc_learn/const/strings.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class CharWebServices {
  late Dio dio;

  CharWebServices(){
    BaseOptions  options = BaseOptions(
      baseUrl:baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000, //means 60 seconds
      receiveTimeout: 20 * 1000, //means 20 seconds
    );
    dio = Dio(options);
  }

  // webservices call
  Future<List<dynamic>> getAllCharecters() async{
    try{
      Response response = await dio.get('characters');
      print(response.data.toString());
      return response.data;
    }catch(e){
      print(e.toString());
      return [];
    }
  }
}
