import 'package:audio_player/models/models.dart';
import 'package:audio_player/models/music_player_data.dart';
import 'package:audio_player/ui/playlist_details/views/playlist_details_screen.dart';
import 'package:audio_player/ui/song_details/views/song_details_screen.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class SongRepository extends Cubit<bool> {
  SongRepository(super.initialState, {required AudioHandler audioHandler})
      : _audioHandler = audioHandler;

  final AudioHandler _audioHandler;

  _updateAndEmit() {
    final state = _audioHandler.playbackState.value.playing;
    emit(state);
  }

  void play() {
    _audioHandler.play();
    _updateAndEmit();
  }

  void pause() => _audioHandler.pause();

  void stop() => _audioHandler.stop();

  bool get isPlaying => _audioHandler.playbackState.value.playing;

  List<MediaItem> get queue => _audioHandler.queue.value;

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
    await Future.wait([
      _audioHandler.removeQueueItemAt(0),
      _audioHandler.addQueueItem(song.toMediaItem()),
    ]);
  }

  navigateToSongDetails(BuildContext context, Song song) async {
    await setCurrentSong(song);
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
