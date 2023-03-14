import 'dart:convert';

import 'package:apitask/modles/photomodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
List<photoModel>photos=[];
class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  List data=[];

void getdata() async{
  await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos")).then((value) =>
          data = jsonDecode(value.body));
  for(int i =0;i<data.length;++i){
    photos.add(photoModel.fromJson(data[i]));
  }
 //print(photos);
  setState(() {

  });
}
@override
  void initState(){
    super.initState();
getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('REST API - json - place holder')),),
    //     body:photos.length==0?Center(
    //     child: CircularProgressIndicator(),
    // ):
    body:
    photos.isEmpty?Center(
    child: CircularProgressIndicator(),
    ):
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount (
          crossAxisCount: 4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,

      ),
          itemBuilder:(context,i){
        return pho(i);
      },
// itemCount: 20,

      ),
    ),

       );
    }
}
Widget pho (int i){
  return Container(
    // height: 70,
    // width: 70,
    decoration: BoxDecoration
      (
    color: Color(0xff9e9e9e),
    borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: Column(
        children: [
          Text('${i+1}'),
          Container(

            child: Expanded(
              child: Image.network('${photos[i].image}',
              // height: 140,
              //   width: 140,
              ),
            ),
          ),

        ],
      ),
    ),
  );
}