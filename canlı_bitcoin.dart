import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var value;
  String priceSymbol = "";
  String amountSymbol = "";
  String price = "Yükleniyor...";
  String amount = "Yükleniyor...";
  String slash = "Yükleniyor...";
  String one = "";
  String equals = "";

  void response() async {
    var varreq = await http
        .get("https://api.btcturk.com/api/v2/trades?pairSymbol=BTC_TRY&last=1");
    String json = varreq.body;
    json = json.substring(json.indexOf("["), json.indexOf("]") + 1);
    value = jsonDecode(json);
    setState(() {
      priceSymbol = value[0]["numerator"];
      amountSymbol = value[0]["denominator"];
      price = value[0]["price"];
      amount = value[0]["amount"];
      slash = "/";
      one = "1";
      equals = "=";
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) => response());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("$priceSymbol$slash$amountSymbol"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "$one $priceSymbol $equals $price",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "$one $amountSymbol $equals $amount",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
