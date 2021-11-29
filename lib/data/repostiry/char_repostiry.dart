
import 'package:bloc_learn/data/models/characters.dart';
import 'package:bloc_learn/data/webservices/char_webservices.dart';
import 'package:flutter/cupertino.dart';

class CharRepository{
  final CharWebServices charWebServices;

  CharRepository(this.charWebServices);

  // webservices call
  Future<List<Character>> getAllCharecters() async{
    final chars = await charWebServices.getAllCharecters();
    return chars.map((char) => Character.fromJson(char)).toList();
  }

  // Geneal
  // Future<List<dynamic>> getAllCharecters() async{
  //   final chars = await charWebServices.getAllCharecters();
  //   return chars.map((char) => Character.fromJson(char)).toList();
  // }

}