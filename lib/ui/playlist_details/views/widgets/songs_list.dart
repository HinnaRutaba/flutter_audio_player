import 'package:atomsbox/atomsbox.dart';
import 'package:audio_player/ui/custom/neu_box.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

import '../../../../models/song.dart';

class SongsList extends StatelessWidget {
  final List<Song> songs;
  const SongsList({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.titleLarge('Recently Played'),
        const SizedBox(height: AppConstants.sm),
        ...songs
            .map((e) => Padding(
                  padding: const EdgeInsets.all(AppConstants.md),
                  child: _SongTile(song: e),
                ))
            .toList()
      ],
    );
  }
}

class _SongTile extends StatefulWidget {
  final Song song;
  const _SongTile({super.key, required this.song});

  @override
  State<_SongTile> createState() => _SongTileState();
}

class _SongTileState extends State<_SongTile> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return NeuBox(
      radius: 50,
      child: Row(
        children: [
          NeuBox(
            radius: 50,
            padding: const EdgeInsets.all(0),
            child: SizedBox(
              width: 40,
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(widget.song.imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(width: AppConstants.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.titleMedium(widget.song.title),
                AppText.bodySmall(widget.song.artist.name),
              ],
            ),
          ),
          const SizedBox(width: AppConstants.md),
          InkWell(
            onTap: () {
              setState(() {
                isPlaying = !isPlaying;
              });
            },
            child: NeumorphicIcon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              style: NeumorphicStyle(
                color: Theme.of(context).shadowColor,
              ),
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
