import 'package:flutter/material.dart';
import 'package:movieapp/pages/search.dart';


class searchmoviedetails extends StatefulWidget {
  int value;
  String overview;
  String posterurl;
  searchmoviedetails({Key key,@required this.value,this.overview,this.posterurl}) : super(key: key);
  @override
  
  _searchmoviedetailsState createState() => _searchmoviedetailsState(value,overview,posterurl);
}

class _searchmoviedetailsState extends State<searchmoviedetails> {
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
      body: Container(
        child: Text("${value}\n ${overview}\n${posterurl}"),

      ),
    );
  }
}
