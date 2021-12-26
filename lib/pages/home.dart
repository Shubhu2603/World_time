// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};

  @override
  Widget build(BuildContext context) {
    data= data.isNotEmpty ? data:ModalRoute.of(context)!.settings.arguments as Map;
   // print(data);

    String bgImage=data['isDaytime']?'day.jpg':'night.jpg';
    Color bgColor=data['isDaytime']? Colors.blue: Colors.indigo;
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 170, 0, 0),
          child: SafeArea(child:Column(
            children: <Widget>[
              TextButton.icon(onPressed: () async{
                dynamic result=await Navigator.pushNamed(context, '/location');
                setState(() {
                  data=result;
                  print(data);
                });
              }, icon: Icon(
                  Icons.location_pin,
                color: Colors.grey[200],
              ), label: Text(
                  "Edit Location",
                style: TextStyle(color: Colors.grey[200]),
              ),),
              SizedBox(height:20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(data['location'],
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                      color:Colors.white
                  ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                  data['time'],
                style: TextStyle(
                  fontSize: 66,
                  color:Colors.white
                ),
              )
            ],
          ),
          ),
        ),
      ),
    );
  }
}
