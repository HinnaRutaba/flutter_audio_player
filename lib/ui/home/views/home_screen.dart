import 'package:atomsbox/atomsbox.dart';
import 'package:audio_player/ui/custom/current_playing_song_wrapper.dart';
import 'package:audio_player/ui/custom/neu_box.dart';
import 'package:audio_player/ui/playlist_details/views/widgets/songs_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

import '../../../models/models.dart';

part 'widgets/_playlist_section.dart';
part 'widgets/_trending_songs_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: false,
        title: AppText.headlineSmall('Good evening!'),
        titleSpacing: AppConstants.md,
      ),
      body: CurrentPlayingSongWrapper(
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _TrendingSongsSection(),
                const SizedBox(height: AppConstants.lg),
                const _PlaylistSection(),
                const SizedBox(height: AppConstants.lg),
                SongsList(songs: Song.songs),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
