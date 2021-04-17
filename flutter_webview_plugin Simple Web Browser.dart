import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: WebviewScaffold(
          url: "https://www.google.com",
          withLocalStorage: true,
          withJavascript: true,
          withZoom: true,
          appBar: appBar(),
        ),
      ),
    );
  }

  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  TextEditingController appBarUrl = TextEditingController();
  double progress = 0;

  AppBar appBar() => AppBar(
        title: TextField(
          controller: appBarUrl,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: "URL",
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () => flutterWebviewPlugin.reloadUrl(appBarUrl.text)),
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => flutterWebviewPlugin.goBack(),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () => flutterWebviewPlugin.goForward(),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(0, 0),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white,
          ),
        ),
      );

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onUrlChanged
        .listen((event) => setState(() => appBarUrl.text = event));
    flutterWebviewPlugin.onProgressChanged
        .listen((event) => setState(() => progress = event));
  }

  @override
  void dispose() {
    super.dispose();
    flutterWebviewPlugin.dispose();
  }
}
