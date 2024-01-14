part of '../home_screen.dart';

class _TrendingSongsSection extends StatelessWidget {
  const _TrendingSongsSection({super.key});

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
                      child: _SongIcon(song: e),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _SongIcon extends StatelessWidget {
  final Song song;
  const _SongIcon({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Todo navigate to song details
      },
      splashColor: Colors.black12,
      child: Column(
        children: [
          NeuBox(
            padding: const EdgeInsets.all(AppConstants.sm),
            radius: 50,
            size: const Size(64, 64),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                //color: Colors.grey.shade300,
                image: DecorationImage(
                  image: NetworkImage(song.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppConstants.lg),
          AppText.bodySmall(
            song.title,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
