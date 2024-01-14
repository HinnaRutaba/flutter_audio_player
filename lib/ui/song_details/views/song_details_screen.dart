import 'package:audio_player/models/models.dart';
import 'package:flutter/material.dart';

class SongDetails extends StatefulWidget {
  final Song song;
  const SongDetails({super.key, required this.song});

  @override
  State<SongDetails> createState() => _SongDetailsState();
}

class _SongDetailsState extends State<SongDetails> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
