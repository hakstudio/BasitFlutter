import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //appBar: AppBar(title: Text("WebView"),),
        body: SafeArea(
          child: WebView(
            initialUrl: "https://google.com",
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    );
  }
}
