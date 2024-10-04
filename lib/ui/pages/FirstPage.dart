
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage();

  @override
  State<StatefulWidget> createState() {
    return _FirstPageState();
  }
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Hello"),
    );
  }

}