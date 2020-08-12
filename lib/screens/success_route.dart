import 'package:flutter/material.dart';

class SuccessRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Success"),
      ),
      body: Center(
        child: Text('When you have succeeded at your goal click success.'),
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
