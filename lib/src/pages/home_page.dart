import 'package:flutter/material.dart';

import 'package:hello_world/src/pages/acercade_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Acerca de'),
          onPressed: () {
            Route route = MaterialPageRoute(builder: (bc) => Acercade());
            Navigator.of(context).push(route);
          },
        ),
      ),
    );
  }
}