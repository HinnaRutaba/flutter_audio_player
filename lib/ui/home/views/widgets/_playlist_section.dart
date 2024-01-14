part of '../home_screen.dart';

class _PlaylistSection extends StatelessWidget {
  const _PlaylistSection({super.key});

  @override
  Widget build(BuildContext context) {
    final trendingSongs = Song.songs.where((song) => song.isTrending).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.titleLarge('Trending Now'),
        const SizedBox(height: AppConstants.sm),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            children: trendingSongs
                .map((e) => Padding(
                      padding: const EdgeInsets.all(AppConstants.md),
                      child: SongIcon(song: e),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
