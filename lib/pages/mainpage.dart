
import "package:tmdb_dart/tmdb_dart.dart";
import 'dart:async' as prefix0;

import "package:flutter/material.dart";
import "dart:async";
import "dart:convert";
import 'package:http/http.dart' as http;
import 'package:smooth_star_rating/smooth_star_rating.dart';

class moviesearch{
  String text;
}
class homepage extends StatefulWidget {
  int movieid;

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
   Future<Map> getJson() async {
  var url =
      'https://api.themoviedb.org/3/movie/504231/recommendations?api_key=36c0f238fd748397377d81265244492c&language=en-US&page=1';
      
  http.Response response = await http.get(url);
  return json.decode(response.body);
  debugPrint(response.body);
}

 void getData() async {
    var data = await getJson();

    setState(() {
      movies = data['results'];
    });
  }
 

var movies;
  
bool searchbar=false;

 
 
  Widget build(BuildContext context) {
   getData();
    return  Container(
        
    child:ListView.builder(
        itemCount: movies==null?0:movies.length,
        itemBuilder:(BuildContext context, int index){
          return ListTile(
                   
                    title: Text("${movies[index]['title']}\n ${movies[index]['popularity']}"),
                    subtitle: SmoothStarRating(
                      rating:movies[index]['vote_average'],
                      size: 10,
                      starCount: 10,
                      allowHalfRating: false,
                      color: Colors.yellowAccent,
                      borderColor: Colors.white,
                      

                    ),
                    
          );
        }
        )
    
    );}
}
