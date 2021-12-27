import 'package:flutter/material.dart';
import '../services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime inst =
        WorldTime(flag: '', url: 'Africa/Khartoum', location: 'Khartoum');
    await inst.getTime();
    // print(inst.time);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': inst.location,
      'flag': inst.flag,
      'time': inst.time,
      'isDay': inst.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,
          ),
        ));
  }
}
