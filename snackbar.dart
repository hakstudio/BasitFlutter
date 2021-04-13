import 'package:flutter/material.dart';

main() => runApp(app());

class app extends StatefulWidget {
  @override
  _appState createState() => _appState();
}

class _appState extends State<app> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("SnackBar"),
        ),
        body: Column(children: [
          Builder(
            builder: (context) => RaisedButton(
              child: Text("BAS!"),
              onPressed: () {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("Uyarı!")));
              },
            ),
          ),
        ],)
      ),
    );
  }
}
