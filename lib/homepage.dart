

import 'dart:math';

import 'package:bmi_app/result_page.dart';
import 'package:flutter/material.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({Key? key}) : super(key: key);

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  bool isMale=true;
  double heightval=170;
  int weightval=55;
  int age=22;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Body mass index"),centerTitle: true,backgroundColor: Theme.of(context).primaryColor),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    SelectGender(context,"Male"),
                    const SizedBox(width: 15,),
                    SelectGender(context,"Female"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color:  Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Height",style: Theme.of(context).textTheme.headline2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(heightval.toStringAsFixed(1),style: Theme.of(context).textTheme.headline1),
                          Text("CM",style: Theme.of(context).textTheme.headline2,),
                        ],
                      ),
                      Slider(
                        activeColor: Colors.teal,
                        min: 90,
                          max: 230,
                          value: heightval, onChanged: (Newvalue){
                        setState(() {
                          heightval=Newvalue;
                        });
                      })
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    age_weight_selector(context,"Weight"),
                    const SizedBox(width: 15,),
                    age_weight_selector(context,"Age"),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height/16,
              child: TextButton(onPressed: (){
                var result= weightval/pow(heightval/100, 2);
                Navigator.push(context, MaterialPageRoute(builder: (context) => resultpage(isMale: isMale, age: age, result: result),));
              },
                  child: Text("Calculate",
                style: Theme.of(context).textTheme.headline2,)),
            )
          ],
        ),
      ),
    );
  }

  Expanded SelectGender(BuildContext context,String gender) {
    return Expanded(
          child: GestureDetector(
            onTap: (){
              setState(() {
                isMale= gender=="Male"? true:false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: (isMale&&gender=="Male")|| (!isMale&&gender=="Female")? Colors.teal : Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(gender=="Male"? Icons.male:Icons.female),
                  const SizedBox(height: 15,),
                  Text(gender,style: Theme.of(context).textTheme.headline2,),

                ],
              ),
            ),
          ),
        );
  }

  Expanded age_weight_selector(BuildContext context,String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color:  Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(type =="Age"?"Age":"Weight",style: Theme.of(context).textTheme.headline2,),
            const SizedBox(height: 15,),
            Text(type =="Age"?"$age":"$weightval",style: Theme.of(context).textTheme.headline1,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  //heroTag: type=="Age"? "age--":"weight--",
                    onPressed: (){
                    setState(() {
                      type=="Age"? age-- : weightval--;
                    });
                    },
                  child: Icon(Icons.remove),
                  mini: true,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                FloatingActionButton(
                  //heroTag: type=="Age"? "age++":"weigh++",
                    onPressed: (){
                      setState(() {
                        type=="Age"? age++ : weightval++;
                      });
                    },
                  child: Icon(Icons.add,),
                  mini: true,
                  backgroundColor: Theme.of(context).primaryColor,

                ),

              ],
            )


          ],
        ),
      ),
    );
  }

}
