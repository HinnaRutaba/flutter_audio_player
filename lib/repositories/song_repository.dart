import 'package:audio_player/models/models.dart';
import 'package:audio_player/models/music_player_data.dart';
import 'package:audio_player/ui/playlist_details/views/playlist_details_screen.dart';
import 'package:audio_player/ui/song_details/views/song_details_screen.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SongRepository {
  SongRepository({required AudioHandler audioHandler})
      : _audioHandler = audioHandler;

  final AudioHandler _audioHandler;

  void play() => _audioHandler.play();

  void pause() => _audioHandler.pause();

  Stream<MusicPlayerData> get musicPlayerDataStream => Rx.combineLatest4(
          _audioHandler.playbackState,
          _audioHandler.queue,
          _audioHandler.mediaItem,
          AudioService.position, (PlaybackState playbackState,
              List<MediaItem> queue, MediaItem? mediaItem, Duration position) {
        return MusicPlayerData(
          currentSong: mediaItem != null ? Song.fromMediaItem(mediaItem) : null,
          songQueue: queue.map((e) => Song.fromMediaItem(e)).toList(),
          playbackState: playbackState,
          currentSongDuration: mediaItem?.duration,
          currentSongPosition: position,
        );
      });

  Future<void> setCurrentSong(Song song) async {
    _audioHandler.removeQueueItemAt(0);
    _audioHandler.addQueueItem(song.toMediaItem());
  }

  navigateToSongDetails(BuildContext context, Song song) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => SongDetails(song: song),
      ),
    );
  }

  navigateToPlaylistDetails(BuildContext context, Playlist playlist) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => PlaylistDetails(playlist: playlist),
      ),
    );
  }
}
