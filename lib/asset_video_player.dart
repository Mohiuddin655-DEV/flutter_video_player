import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AssetVideoPlayer extends StatefulWidget {
  @override
  State<AssetVideoPlayer> createState() => _AssetVideoPlayerState();
}

class _AssetVideoPlayerState extends State<AssetVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/Butterfly-209.mp4');
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 20.0),
          ),
          const Text('With assets mp4'),
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  GestureDetector(
                    onTap: () {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    },
                    child: Center(
                      child: CircleAvatar(
                        child: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
