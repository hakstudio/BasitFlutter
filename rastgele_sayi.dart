import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Rastgele Sayı"),
          centerTitle: true,
        ),
        body: RandomNum(),
      ),
    );
  }
}

class RandomNum extends StatefulWidget {
  @override
  _RandomNumState createState() => _RandomNumState();
}

class _RandomNumState extends State<RandomNum> {
  int sayi=0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            "$sayi",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          FlatButton(
            child: Text("Rastgele"),
            onPressed: () {
              setState((){
                sayi=Random().nextInt(100+1);
              });
            },
          ),
        ],
      ),
    );
  }
}
