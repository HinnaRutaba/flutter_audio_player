part of '../home_screen.dart';

class _PlaylistSection extends StatelessWidget {
  const _PlaylistSection({super.key});

  @override
  Widget build(BuildContext context) {
    final playlist = Playlist.playLists;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.titleLarge('Your Playlists'),
        const SizedBox(height: AppConstants.sm),
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            clipBehavior: Clip.none,
            enlargeCenterPage: true,
            aspectRatio: 16 / 12,
            viewportFraction: 0.6,
            pauseAutoPlayOnTouch: true,
          ),
          items: playlist.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(AppConstants.md),
                  child: _PlaylistCard(playlist: i),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _PlaylistCard extends StatelessWidget {
  final Playlist playlist;
  const _PlaylistCard({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        context.read<SongRepository>().navigateToPlaylistDetails(
              context,
              playlist,
            );
      },
      child: NeuBox(
        padding: const EdgeInsets.all(AppConstants.sm),
        radius: AppConstants.borderRadius,
        size: Size(size.width * 0.6, size.height * 0.3),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppConstants.borderRadius),
              topRight: Radius.circular(AppConstants.borderRadius),
            ),
            //color: Colors.grey.shade300,
            image: DecorationImage(
              image: NetworkImage(playlist.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.md),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.headlineSmall(playlist.title),
                AppText.bodyMedium('${playlist.songs.length} songs')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
