part of '../home_screen.dart';

class _TrendingSongsSection extends StatelessWidget {
  const _TrendingSongsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final trendingSongs = Song.songs.where((song) => song.isTrending).toList();
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: NeuBox(
        child: Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
      ),
      alignment: Alignment.center,
    );
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: trendingSongs.map((e) => SongIcon(song: e)).toList(),
    );
    return AppGrid(
      title: AppText('Trending Now'),
      gridSettings: const AppGridSettings(
        crossAxisCount: 2,
        childAspectRatio: 3.55,
      ),
      gridItems: trendingSongs.map(
        (song) {
          return ListTile(
            leading: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300,
                image: DecorationImage(
                  image: NetworkImage(song.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: AppText.bodyMedium(
              song.title,
              fontWeight: FontWeight.bold,
            ),
            onTap: () {
              try {
                context.read<SongRepository>().setCurrentSong(song);
                context.read<SongRepository>().play();
              } catch (e, s) {
                print("EEEEE_____${e}____$s");
              }
            },
          );
        },
      ).toList(),
    );
  }
}

class SongIcon extends StatelessWidget {
  final Song song;
  const SongIcon({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      padding: const EdgeInsets.all(12),
      style: NeumorphicStyle(
        shape: NeumorphicShape.convex,
        boxShape: NeumorphicBoxShape.circle(),
        depth: 0,
        lightSource: LightSource.topLeft,
        color: Colors.grey[200],
        shadowDarkColor: Colors.grey.shade500,
        shadowDarkColorEmboss: Colors.grey.shade500,
        shadowLightColorEmboss: Colors.white,
        shadowLightColor: Colors.white,
      ),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          //color: Colors.grey.shade300,
          image: DecorationImage(
            image: NetworkImage(song.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
