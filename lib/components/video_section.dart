// Made by Fandy Fathurrohman
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoSection extends StatefulWidget {
  final String title;
  final List<String> urls;

  const VideoSection({super.key, required this.title, required this.urls});

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  bool _isExpanded = false;
  late List<bool> _activePlayers;

  @override
  void initState() {
    super.initState();
    _activePlayers = List.generate(widget.urls.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        onExpansionChanged: (expanded) {
          setState(() => _isExpanded = expanded);
        },
        title: Text(
          widget.title,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: _isExpanded
            ? List.generate(widget.urls.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _youtubeEmbed(index, widget.urls[index]),
                );
              })
            : [],
      ),
    );
  }

  Widget _youtubeEmbed(int index, String url) {
    final videoId = YoutubePlayer.convertUrlToId(url);
    if (videoId == null) return const SizedBox.shrink();

    if (_activePlayers[index]) {
      return YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
          ),
        ),
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
      );
    } else {
      return GestureDetector(
        onTap: () {
          setState(() {
            for (int i = 0; i < _activePlayers.length; i++) {
              _activePlayers[i] = false;
            }
            _activePlayers[index] = true;
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              'https://img.youtube.com/vi/$videoId/0.jpg',
              fit: BoxFit.cover,
            ),
            const Icon(Icons.play_circle_fill, size: 64, color: Colors.white70),
          ],
        ),
      );
    }
  }
}
