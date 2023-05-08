import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Subjects extends StatelessWidget {
  final String code;
  final String name;
  final String description;
  final String imageUrl;
  final String url;
  final Key key;

  const Subjects({
    required this.code,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.url,
    required this.key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressColors: ProgressBarColors(
            playedColor: const Color.fromRGBO(251, 142, 55, 1),
            handleColor: const Color.fromRGBO(251, 142, 55, 1),
          ),
          onReady: () {
            _controller.addListener(() {
              print('hello');
            });
          },
        ),
        const SizedBox(height: 16),
        Text(
          '$name\n$code',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'Lexend',
          ),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontFamily: 'Lexend',
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
