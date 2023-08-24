import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class resultpage extends StatelessWidget {
  resultpage({Key? key, required this.isMale, required this.age, required this.result}) : super(key: key);
final bool isMale;
final int age;
final double result;
Color green=Colors.green;
Color red=Colors.red;
Color orang=Colors.orange;
Color blue=Colors.blue;
String get healthresult{
  String resulttext='';
  if(result>=30) resulttext='Obese';
  else if(result>25&&result<30) resulttext='Overweight';
  else if(result>=18.5 && result<=24.9) resulttext='Normal';
  else resulttext='Thin';
  return resulttext;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:Icon(Icons.arrow_back_ios,size: 40,),
          //replace with our own icon data.
        ),
        backgroundColor: Colors.teal,
        title: Text("Body mass index"),
        centerTitle: true,

      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Text("Gender : ${isMale? "Male" : "Female"}",
          style: Theme.of(context).textTheme.headline1,),
        Text("Result : ${result.toStringAsFixed(1)}",
          style: Theme.of(context).textTheme.headline1,),
        Column(
          children: [
            Text("Healthness :",
              style: Theme.of(context).textTheme.headline1,textAlign:TextAlign.center),
            Text( "$healthresult",style: TextStyle(fontSize: 45,fontWeight: FontWeight.w800,color: (healthresult=='Thin')? blue:
            (healthresult=='Normal')? green:(healthresult=='Overweight')? orang:red), )
          ],
        ),
        Text("Age : $age",
          style: Theme.of(context).textTheme.headline1,),

      ],)),
    );
  }
}
