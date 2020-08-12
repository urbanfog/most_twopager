import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/flutter_demo.dart';
import 'counter_storage.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Reading and Writing Files',
      home: FlutterDemo(storage: CounterStorage()),
    ),
  );
}
