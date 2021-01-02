import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random advice'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text("Notify"),
          ),
        ),
      ),
    );
  }
}
