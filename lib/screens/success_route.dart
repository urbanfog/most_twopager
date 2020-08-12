import 'package:flutter/material.dart';

class SuccessRoute extends StatelessWidget {
  SuccessRoute({@required this.goal});
  final String goal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Your Success"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100),
            Text(
              'When you have succeeded, \nclick success.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            SizedBox(height: 50),
            Text(
              goal,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 30),
            // todo review alternate completion button
            FlatButton(
              child: Container(
                height: 65,
                width: 200,
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.adjust),
                    SizedBox(width: 10),
                    Text(
                      'Success',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                // todo: update goal status to complete and increment completion counter
              },
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton.extended(
//          onPressed: () {
//            Navigator.pop(context);
//          },
//          label: Text('Success'),
//          tooltip: 'Success',
//          icon: Icon(Icons.adjust)),
    );
  }
}
