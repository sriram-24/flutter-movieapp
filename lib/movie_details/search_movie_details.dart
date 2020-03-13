import 'package:flutter/material.dart';
import 'package:movieapp/pages/search.dart';
import 'package:tmdb_dart/tmdb_dart.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';


class searchmoviedetails extends StatefulWidget {
  int value;
  String title;
  String overview;
  String posterurl;
  double popular; 
  String originaltitle;
  String originallanguage;
  DateTime releasedate;
  searchmoviedetails({Key key,@required this.value,this.overview,this.posterurl,this.popular,this.title,this.originaltitle,this.originallanguage,this.releasedate}) : super(key: key);
  @override
  
  _searchmoviedetailsState createState() => _searchmoviedetailsState(value,overview,posterurl,popular,title,originaltitle,originallanguage,releasedate);
}

class _searchmoviedetailsState extends State<searchmoviedetails> {
  
  int value;
  String overview;
  String posterurl;
  double popular;
  String title;
  String originaltitle;
  String originallanguage;
  DateTime releasedate;
  _searchmoviedetailsState(this.value,this.overview,this.posterurl,this.popular,this.title,this.originaltitle,this.originallanguage,this.releasedate);
   
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Movie Details"),
      ),
      body:Container(
        child:FutureBuilder(
        
         
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    
                    height: 300,
                    child: Image.network(posterurl),
                  ),
                  
                  Container(
                    child: Text("$originaltitle",textAlign: TextAlign.center,style: TextStyle(fontSize: 30),),
                    
                  ),
                  
                  
                  Container(
                    child: Text("Ratings:  ${popular}",style: TextStyle(fontSize: 18),),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white12,
                    ),
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.center,
                  ),
                  
                  Container(
                    child: Text("language: $originallanguage",style: TextStyle(fontSize: 18),),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white12,
                    ),
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.center,
                  ),
                  Container(
                    child: Text("release date: $releasedate",style: TextStyle(fontSize: 18),),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white12,
                    ),
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.center,
                  ),
                  Container(
                    child: Text("Description:  \n ${overview} ",style: TextStyle(fontSize: 18),),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white12,
                    ),
                    margin:EdgeInsets.fromLTRB(10, 5, 10, 5),
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.center,
                    
                  ),
                  
                 
                ],
              ),
            ); ;
          },
        ),
        ) 
      );
      
   
  }
}
