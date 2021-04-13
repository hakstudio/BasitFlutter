import 'package:flutter/material.dart';

main() => runApp(app());

class app extends StatefulWidget {
  @override
  _appState createState() => _appState();
}

class _appState extends State<app> {
  int sayi = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Sayaç"),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "$sayi",
                style: TextStyle(fontSize: 50),
              ),
              RaisedButton(
                  child: Text(
                    "+1",
                    style: TextStyle(fontSize: 30),
                  ),
                  onPressed: () {
                    setState(() {
                      sayi++;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
