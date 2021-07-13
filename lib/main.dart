import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      home: MyHomePage(),
      theme: ThemeData.dark(),
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
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/camera.svg",
              width: 20,
              height: 20,
              color: Colors.white,
            ),
            Text(
              'Instagram',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Billabong',
                fontSize: 30,
              ),
            ),
            SvgPicture.asset(
              "assets/images/send.svg",
              width: 20,
              height: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: homePage(),
      bottomNavigationBar:
          getBNB(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget getBNB() {
    return Container(
      width: double.infinity,
      height: 60,
      color: Colors.black54,
      child: Padding(
        padding: EdgeInsets.only(top: 15, bottom: 20, right: 20, left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/home_active.svg",
              width: 20,
              height: 20,
              color: Colors.white,
            ),
            SvgPicture.asset(
              "assets/images/home.svg",
              width: 20,
              height: 20,
              color: Colors.white,
            ),
            SvgPicture.asset(
              "assets/images/home_active.svg",
              width: 20,
              height: 20,
              color: Colors.white,
            ),
            SvgPicture.asset(
              "assets/images/home.svg",
              width: 20,
              height: 20,
              color: Colors.white,
            ),
            SvgPicture.asset(
              "assets/images/home_active.svg",
              width: 20,
              height: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
