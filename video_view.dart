import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  ChewieController chewieController;
  double videoAspectRatio = 3 / 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.network(
          "https://tv-trt1.live.trt.com.tr/master_720.m3u8"),
      autoInitialize: true,
      autoPlay: true,
      looping: false,
      aspectRatio: videoAspectRatio,
      errorBuilder: (context, errorMessage) => Text(errorMessage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Video"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: videoAspectRatio,
              child: Chewie(
                controller: chewieController,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    chewieController.dispose();
  }
}
