import 'package:flutter/material.dart';
import 'package:flutter_video_player/asset_video_player.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey<String>('home_page'),
      body: AssetVideoPlayer(),
    );
  }
}
