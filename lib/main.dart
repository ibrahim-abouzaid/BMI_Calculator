
import 'package:flutter/material.dart';

import 'homepage.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primaryColor: Colors.teal,
        canvasColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white, size: 90,),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 45,fontWeight: FontWeight.w800,color: Colors.white),
          headline2: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),

        ),
      ),
      home: Myhomepage(),
    );
  }
}
