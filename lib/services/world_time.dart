//import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String time='';
  String flag; //URL to asset flag
  String url; //location URL for Api endpoint
  late bool isDaytime;//day or night

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //print(datetime);
      //print(offset);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //print(now);
      isDaytime= now.hour>6 && now.hour< 19? true: false;
      //set the time
      time = DateFormat.jm().format(now);
      //print(time);
    }
    catch(e)
    {
      print(e);
    }
  }
}

