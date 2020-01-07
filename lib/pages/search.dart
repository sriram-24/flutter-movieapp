import "package:flutter/material.dart";
import 'package:movieapp/movie_details/search_movie_details.dart';
import 'package:tmdb_dart/tmdb_dart.dart';
import "package:smooth_star_rating/smooth_star_rating.dart";

class details{
  int id;
  String title;
  String overview;
  String posterurl;
  String originaltitle;
  String originallanguage;
  DateTime releasedate;
  String backdroppath;
  List<int> genreid;
  bool video;
  int popularity;
  var popular;
  details(this.id,this.posterurl,
   this.title,
    
    this.overview,
    
    this.popular

  ); 
}

class searchpage extends StatefulWidget {
  @override
  _searchpageState createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  
  Future<List<details>> mine(t) async{
  TmdbService service=new TmdbService("36c0f238fd748397377d81265244492c");
  await service.initConfiguration();
  var pageresult= await service.searchMovies(t);
  List<details> det=[];
  for (var movie in pageresult.results){
    details detail=details(
    movie.id,
    movie.posterPath,
    
    movie.title,
    movie.overview,
    
    
    
    movie.voteAverage.toDouble());

    det.add(detail);
  }
  print(det.length);
  return det;

  }
  
  String t="";
  void settext(String text){
    setState(() {
      t=text;
      mine(t);
      
    });
  }
  bool searchbar=false;
  int id;
  String overView;
  String title;
  String posterurl;
  String originaltitle;
  String originallanguage;
  DateTime releasedate;
  String backdroppath;
  List<int> genreid;
  bool video;
  int popularity;
  var popular;
  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      
       appBar: new AppBar(
         actions: <Widget>[
           searchbar ? IconButton(
           
            icon:Icon(
              Icons.cancel,color: Colors.white,
              
              ),
              onPressed: (){
                setState(() {
                  this.searchbar=false;
                });
              },
              )
          :IconButton(
           
            icon:Icon(
              Icons.search,color: Colors.white,
              
              ),
              onPressed: (){
                setState(() {
                  this.searchbar=true;
                });
              },
              )
        ],

        title: !searchbar ? new Text("search") : TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.search),
            hintText: "search movies here"
            ),
            onSubmitted:settext

          ),
        centerTitle: true,
       
      ),
      body:  new Container(
        child: FutureBuilder(
          future: mine(t),
          builder: (BuildContext context , AsyncSnapshot snapshot){
            if(snapshot.data==null){
              return new Text("no results found");
            }
            else{
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, var index){
                return ListTile(
                    leading: Image(
                      
                      image: NetworkImage("${snapshot.data[index].posterurl}"),
                    ),
                   
                    title: Text("${snapshot.data[index].id}\n${snapshot.data[index].title}\n ${snapshot.data[index].popular}"),
                    subtitle: SmoothStarRating(
                      rating:snapshot.data[index].popular,
                      size: 10,
                      starCount: 10,
                      allowHalfRating: false,
                      color: Colors.yellowAccent,
                      borderColor: Colors.white,
                      

                    ),
                    
                    
                    onTap: (){
                      id=snapshot.data[index].id;
                      overView=snapshot.data[index].overview;

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => searchmoviedetails(value:id,overview:overView)
                      ));

                     
                    },
                );
              }
            );
            }
          }
        )
      )
    );
    
  }
  
}



                    
