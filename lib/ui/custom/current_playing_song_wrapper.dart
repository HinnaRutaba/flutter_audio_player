import 'package:audio_player/models/models.dart';
import 'package:audio_player/ui/playlist_details/views/widgets/song_tile.dart';
import 'package:flutter/material.dart';

class CurrentPlayingSongWrapper extends StatefulWidget {
  final Widget child;
  const CurrentPlayingSongWrapper({super.key, required this.child});

  @override
  State<CurrentPlayingSongWrapper> createState() =>
      _CurrentPlayingSongWrapperState();
}

class _CurrentPlayingSongWrapperState extends State<CurrentPlayingSongWrapper> {
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: widget.child),
        if (isPlaying) ...[
          SongTile(
            song: Song.songs.first,
            asStickyNotification: true,
          ),
        ],
      ],
    );
  }
}
