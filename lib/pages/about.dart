import 'package:flutter/material.dart';
class aboutpage extends StatefulWidget {
  @override
  _aboutpageState createState() => _aboutpageState();
}

class _aboutpageState extends State<aboutpage> {
  var shape=BoxShape.circle;
  void changeshape(){
    setState(() {
      shape=BoxShape.rectangle;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
       appBar: new AppBar(
        title:  new Text("About"),
        centerTitle: true,
        
      ),
      body:  Container(
       
      ),
      
    );
  }
}