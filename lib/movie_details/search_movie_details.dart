import 'package:flutter/material.dart';
import 'package:movieapp/pages/search.dart';
import 'package:tmdb_dart/tmdb_dart.dart';


class searchmoviedetails extends StatefulWidget {
  int value;
  String overview;
  String posterurl;
  searchmoviedetails({Key key,@required this.value,this.overview,this.posterurl}) : super(key: key);
  @override
  
  _searchmoviedetailsState createState() => _searchmoviedetailsState(value,overview,posterurl);
}

class _searchmoviedetailsState extends State<searchmoviedetails> {
  Future<List<searchdetails>> minesearch() async{
  TmdbService service=new TmdbService("36c0f238fd748397377d81265244492c");
  await service.initConfiguration();
  var pageresult= await service.searchMovies(value.toString());
  List<searchdetails> det=[];
  for (var movie in pageresult.results){
    searchdetails detail=searchdetails(
    movie.title,
    movie.video,
    movie.backdropPath, 
    movie.popularity,
    movie.originalLanguage,
    movie.originalTitle,
    movie.popularity,
    movie.releaseDate,
    movie.genreIds);


    det.add(detail);
  }
  print(det.length);
  return det;

  }

  int value;
  String overview;
  String posterurl;
  _searchmoviedetailsState(this.value,this.overview,this.posterurl);
   
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Movie Details"),
      ),
      body:Container(
        child:FutureBuilder(
          future: minesearch(),
         
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 300,
                    
                    child: Image.network(posterurl),
                  ),
                 
                ],
              ),
            );
          },
        ),
      )
    );
  }
}
class searchdetails{
  
  String title;
  
 
  String originaltitle;
  String originallanguage;
  DateTime releasedate;
  String backdroppath;
  List<int> genreid;
  bool video;
  int popularity;
  var popular;
  searchdetails(
    this.title,
   this.video,
   
   this.backdroppath, 
    this.popular,
    this.originallanguage,
    this.originaltitle,
    this.popularity,
    this.releasedate,
    this.genreid

  ); 
}
