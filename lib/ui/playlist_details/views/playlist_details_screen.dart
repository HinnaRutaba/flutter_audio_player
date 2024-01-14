import 'package:atomsbox/atomsbox.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/ui/custom/current_playing_song_wrapper.dart';
import 'package:audio_player/ui/playlist_details/views/widgets/song_tile.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class PlaylistDetails extends StatelessWidget {
  final Playlist playlist;
  const PlaylistDetails({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CurrentPlayingSongWrapper(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: NeumorphicIcon(
                  Icons.arrow_circle_left,
                  style: NeumorphicStyle(
                    color: Theme.of(context).shadowColor,
                  ),
                  size: 40,
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                title: AppText.headlineSmall(playlist.title),
                background: Image.network(
                  playlist.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(AppConstants.md),
                    child: SongTile(song: playlist.songs[i]),
                  );
                },
                childCount: playlist.songs.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
