import 'package:flutter/material.dart';
import 'package:mysample/counter_storage.dart';
import 'dart:io';
import 'success_route.dart';

class FlutterDemo extends StatefulWidget {
  final CounterStorage storage;

  FlutterDemo({Key key, @required this.storage}) : super(key: key);

  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter;
  TextEditingController _controller;
  String newGoal;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });

    widget.storage.readText().then((String goal) {
      setState(() {
        _controller = TextEditingController();
        _controller.text = goal;
      });
    });
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // todo: Feels like this and saveGoal could be extracted to a Goal class
  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });
    // Write the variable as a string to the file.
    return widget.storage.writeCounter(_counter);
  }

  Future<File> _saveGoal() {
    // Write the variable as a string to the file.
    return widget.storage.writeText(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reading and Writing Files')),
      body: Column(children: <Widget>[
        Text(
          '_goalStats',
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Add a new goal here',
            ),
            textInputAction: TextInputAction.done,
            maxLines: null,
            controller: _controller,
            onChanged: (String value) {
              newGoal = value;
              // todo: DONE move action from onSubmitted to set button onPressed
              // todo: move from txt to json
              // todo: model Goal class - status: complete, incomplete
              // todo: show dialog on set button being pressed
              // todo: update stats upon success button being pressed
              // todo: add count up timer -
            },
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _incrementCounter();
            _saveGoal();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SuccessRoute(goal: newGoal)));
          },
          label: Text('Set'),
          tooltip: 'Set',
          icon: Icon(Icons.adjust)),
    );
  }
}
