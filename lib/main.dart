// import 'package:flutter/material.dart';
import 'package:cupertino_app_assignment/screens/thirdscreen.dart';
import 'package:flutter/cupertino.dart';

import 'screens/secondscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (ctx) => MyHomePage(),
        "/second": (ctx) => SecondPage(),
        "/third": (ctx) => ThirdScreen(),
      },
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
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: Center(
        child: CupertinoButton(
          minSize: 10,
          padding: EdgeInsets.all(15),
          child: Text(
            "Create",
            style: TextStyle(color: CupertinoColors.black, fontSize: 24),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/second');
          },
          color: CupertinoColors.lightBackgroundGray,
        ),
      ),
    );
  }
}
