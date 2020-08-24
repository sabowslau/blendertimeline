import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:timeline/timelinecontrol.dart';
import 'package:timeline/timelinemodel.dart';

void main() {
  runApp(MyApp(
    model: new TimeLineModel(),
  ));
}

class MyApp extends StatelessWidget {
  var model;
  MyApp({this.model});
  @override
  Widget build(BuildContext context) {
    return ScopedModel<TimeLineModel>(
      model: model,
      child: MaterialApp(
        title: 'Timeline Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TimeLineControl(),
    );
  }
}
