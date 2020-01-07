

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/pages/about.dart';
import 'package:movieapp/pages/mainpage.dart';
import 'package:movieapp/pages/search.dart';
import 'package:splashscreen/splashscreen.dart';



 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: "movieapp",
      home: homePage(),        
    
     
      
      
    );
  }
}
class homePage extends StatefulWidget {
  homePage({Key key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new afterintro(),
      title: new Text(
        "welcome to movie app",
        style: new TextStyle(
          fontWeight: FontWeight.bold,fontSize: 20
          ),
        ),
      image: new Image.asset("assets/icons8-google-128.png"),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100,
      onClick: (){
        print("movie app");
      },
      loaderColor: Colors.green,
      
    );
  }
 
  }
class afterintro extends StatefulWidget {
  @override
  _afterintroState createState() => _afterintroState();
}

class _afterintroState extends State<afterintro> {
  int _currentindex=0;
  final List<Widget> _children =[
    homepage(),
    searchpage(),
    aboutpage()
  ];

  void ontapped(int _index){
    setState(() {
      _currentindex=_index;
      
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: _children[_currentindex],
      
      
     
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black26,
        onTap: ontapped,
        index:_currentindex,
        backgroundColor: Colors.black12,
        buttonBackgroundColor: Colors.black,
        height: 50,
        items: <Widget>[
          
          Icon(Icons.home,size: 30,color: Colors.white,),
          Icon(Icons.search,size: 30,color: Colors.white,),
          Icon(Icons.supervisor_account,size: 30,color: Colors.white,),
        ],
        
        animationDuration: Duration(
          milliseconds: 300
          ),
          animationCurve: Curves.slowMiddle,
        
      ),

    
    );
}
}