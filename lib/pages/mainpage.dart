
import "package:tmdb_dart/tmdb_dart.dart";
import 'dart:async' as prefix0;

import "package:flutter/material.dart";
import "dart:async";
import "dart:convert";
import 'package:http/http.dart' as http;


class homepage extends StatefulWidget {
  
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  
Future<String> mine() async{
  TmdbService service=new TmdbService("36c0f238fd748397377d81265244492c");
  await service.initConfiguration();
  var pageresult= await service.searchMovies("indru netru naalai");
  for (var movie in pageresult.results){
    print("${movie.title} - ${movie.overview}");
  }
  }
 
  @override
 
  Widget build(BuildContext context) {
    
    return new Scaffold(
       appBar:new  AppBar(
        title: new Text("movieapp"),
        centerTitle: true,

      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text("click"),
          onPressed: mine,
        ),
      ),
      
    );
  }
}

