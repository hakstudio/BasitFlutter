import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  WebViewController webViewController;
  TextEditingController appBarUrl = TextEditingController();
  int progress = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
                onPressed: () => webViewController.loadUrl(appBarUrl.text)),
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => webViewController.goBack(),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () => webViewController.goForward(),
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size(0, 0),
            child: LinearProgressIndicator(
              value: progress / 100,
              backgroundColor: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
          child: WebView(
            initialUrl: "https://www.google.com",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (webViewController) =>
                this.webViewController = webViewController,
            onPageStarted: (url) => setState(() => appBarUrl.text = url),
            onProgress: (progress) => setState(() => this.progress = progress),
            onPageFinished: (url) => setState(() => progress = 0),
          ),
        ),
      ),
    );
  }
}
