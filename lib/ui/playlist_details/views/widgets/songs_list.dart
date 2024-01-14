import 'package:atomsbox/atomsbox.dart';
import 'package:audio_player/ui/playlist_details/views/widgets/song_tile.dart';
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
                  child: SongTile(song: e),
                ))
            .toList()
      ],
    );
  }
}
