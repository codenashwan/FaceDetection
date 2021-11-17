import 'package:flutter/material.dart';
import 'camera/cam.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              height: 500,
              child: Cam(),
            ),
          ],
        ),
      ),
    );
  }
}
