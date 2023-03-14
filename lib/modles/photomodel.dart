import 'package:flutter/material.dart';
class photoModel{
  int? albumId;
  int? id;
  String? title;
  String? image;
photoModel({required this.albumId,required this.id,required this.title, required this.image});
factory photoModel.fromJson(Map jsonData){
return photoModel(
    albumId: jsonData['albumId'],
    id: jsonData["id"],
    title: jsonData['title'],
    image: jsonData['url']
);
}
}