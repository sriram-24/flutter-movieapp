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
      body:  Center(
        child: Row(
          children: <Widget>[
            Container(
              child: RaisedButton(onPressed: (){
                showAboutDialog(
                  context: context,
                  applicationIcon: Image.asset("appicon.png"),
                  applicationName: "MovieInfiity",
                  applicationVersion: "1.0.0",
                  applicationLegalese: "Developed by ArchLinux Team"

                  );
              },
                child:Text("About app")
              ),
            ),
            RaisedButton(
              onPressed: () async {
                const url="https://www.github.com/sriram-24";
                
              },
              child: Text("View Source code"),
            )
          ],
        ),
      ),
      
      
    );
  }
}