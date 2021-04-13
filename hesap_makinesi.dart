import 'package:flutter/material.dart';

main() => runApp(app());

class app extends StatefulWidget {
  @override
  _appState createState() => _appState();
}

class _appState extends State<app> {
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  double sonuc = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hesap Makinesi"),
        ),
        body: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: text1,
                ),
                Divider(
                  height: 4,
                ),
                TextField(
                  controller: text2,
                ),
              ],
            ),
            RaisedButton(
              onPressed: () => topla(),
              child: Text("+"),
            ),
            Divider(height: 8,),
            RaisedButton(
              onPressed: () => cikar(),
              child: Text("-"),
            ),
            Divider(height: 8,),
            RaisedButton(
              onPressed: () => carp(),
              child: Text("*"),
            ),
            Divider(height: 8,),
            RaisedButton(
              onPressed: () => bol(),
              child: Text("/"),
            ),
            Text("Sonuc: $sonuc"),
          ],
        ),
      ),
    );
  }

  void topla() {
    setState(() {
      sonuc = double.parse(text1.text) + double.parse(text2.text);
    });
  }

  void cikar() {
    setState(() {
      sonuc = double.parse(text1.text) - double.parse(text2.text);
    });
  }

  void carp() {
    setState(() {
      sonuc = double.parse(text1.text) * double.parse(text2.text);
    });
  }

  void bol() {
    setState(() {
      sonuc = double.parse(text1.text) / double.parse(text2.text);
    });
  }
}
