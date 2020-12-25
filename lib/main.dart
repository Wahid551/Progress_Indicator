import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _init = 0.0;
  double _step = 0.0;
  void update() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _init = _init + 0.05;
      });
    });
  }

  Widget _Stepindicator() {
    String value = (_step * 5).toString()[0];
    return Column(
      children: [
        Text('Step $value of Step 5 Completed'),
        SizedBox(
          height: 5.0,
        ),
        LinearProgressIndicator(
          value: _step,
        ),
        SizedBox(height: 5.0),
        RaisedButton(
          onPressed: () {
            setState(() {
              _step = _step + 0.2;
            });
          },
          child: Text('Start'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          update();
        },
        child: Icon(Icons.file_download),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Progress Indicator'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircularProgressIndicator(
                value: _init,
                backgroundColor: Colors.indigo,
                valueColor: AlwaysStoppedAnimation(Colors.red),
              ),
              SizedBox(
                height: 20.0,
              ),
              LinearProgressIndicator(
                value: _init,
                backgroundColor: Colors.indigo,
                minHeight: 5.0,
                valueColor: AlwaysStoppedAnimation(Colors.red),
              ),
              SizedBox(height: 30.0),
              _Stepindicator(),
            ],
          ),
        ),
      ),
    );
  }
}
