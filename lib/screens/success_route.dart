import 'package:flutter/material.dart';

class SuccessRoute extends StatelessWidget {
  SuccessRoute({@required this.goal});
  final String goal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Success"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 100),
          Text(
            'When you have succeeded, \nclick success.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(height: 50),
          Text(goal,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text('Success'),
          tooltip: 'Success',
          icon: Icon(Icons.adjust)),
    );
  }
}
