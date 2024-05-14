import 'package:flutter/material.dart';
import 'package:watch_it/core/resources/color_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String id;

  const WebViewScreen(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.sBlack,
      appBar: AppBar(
        backgroundColor: ColorManager.sBlack,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorManager.sWhite,
          ),
        ),
      ),
      body: YoutubePlayer(
        controller: YoutubePlayerController(initialVideoId: id),
        showVideoProgressIndicator: true,

      ),

    );
  }
}
