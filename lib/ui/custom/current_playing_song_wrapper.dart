import 'package:audio_player/models/models.dart';
import 'package:audio_player/repositories/song_repository.dart';
import 'package:audio_player/ui/playlist_details/views/widgets/song_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentPlayingSongWrapper extends StatefulWidget {
  final Widget child;
  const CurrentPlayingSongWrapper({super.key, required this.child});

  @override
  State<CurrentPlayingSongWrapper> createState() =>
      _CurrentPlayingSongWrapperState();
}

class _CurrentPlayingSongWrapperState extends State<CurrentPlayingSongWrapper> {
  @override
  Widget build(BuildContext context) {
    final songRepository = context.watch<SongRepository>();
    return Column(
      children: [
        Expanded(child: widget.child),
        if (songRepository.isPlaying) ...[
          SongTile(
            song: Song.songs.first,
            asStickyNotification: true,
          ),
        ],
      ],
    );
  }
}
