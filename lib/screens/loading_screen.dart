// ignore_for_file: missing_return

import 'dart:ffi';

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import "location_screen.dart";

const apikey = "eb3cfa8d4dd2332da466ccf21d4cbe4f";


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longtitude;

  @override
  // ignore: override_on_non_overriding_member
  Void initstate() {
    super.initState();

    getlocationData();
    //getData();
  }

  void getlocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = (location.latitude);
    longtitude = (location.longtitude);

    Networkhelper networkhelper = Networkhelper(
        ' https://api.openweathermap.org/data/3.0/weather?lat=$latitude&$longtitude&appid=$apikey');

    var weatherData = await networkhelper.getdata();

    Navigator.push(context, MaterialPageRoute(builder: ((context) {
      return LocationScreen();
    })));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       child: SpinKitDoubleBounce(color: Colors.white,size: 100,),
      ),
    );
  }
}
