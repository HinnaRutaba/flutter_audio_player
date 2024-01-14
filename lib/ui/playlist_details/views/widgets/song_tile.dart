import 'package:atomsbox/atomsbox.dart';
import 'package:audio_player/config/app_color_scheme.dart';
import 'package:audio_player/repositories/song_repository.dart';
import 'package:audio_player/ui/custom/neu_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

import '../../../../models/song.dart';

class SongTile extends StatefulWidget {
  final Song song;
  final bool asStickyNotification;

  const SongTile(
      {super.key, required this.song, this.asStickyNotification = false});

  @override
  State<SongTile> createState() => _SongTileState();
}

class _SongTileState extends State<SongTile> {
  late SongRepository songRepository;

  IconData get icon =>
      songRepository.isPlaying ? Icons.pause : Icons.play_arrow;
  Color get textColor =>
      widget.asStickyNotification ? Colors.white : Colors.black;

  Widget get songIcon => SizedBox(
        width: 40,
        height: 40,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(widget.song.imageUrl, fit: BoxFit.cover),
        ),
      );

  @override
  Widget build(BuildContext context) {
    songRepository = context.watch<SongRepository>();
    return InkWell(
      onTap: () {
        context.read<SongRepository>().navigateToSongDetails(
              context,
              widget.song,
            );
      },
      child: NeuBox(
        radius: widget.asStickyNotification ? 0 : 50,
        padding: EdgeInsets.all(
            widget.asStickyNotification ? AppConstants.lg : AppConstants.md),
        backgroundColor: widget.asStickyNotification
            ? Theme.of(context).primaryColor
            : AppColors.containerColor,
        child: Row(
          children: [
            widget.asStickyNotification
                ? songIcon
                : NeuBox(
                    radius: 50,
                    padding: const EdgeInsets.all(0),
                    child: songIcon,
                  ),
            const SizedBox(width: AppConstants.lg),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.titleMedium(
                    widget.song.title,
                    color: textColor,
                  ),
                  AppText.bodySmall(
                    widget.song.artist.name,
                    color: textColor,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppConstants.md),
            InkWell(
              onTap: () async {
                if (songRepository.isPlaying) {
                  songRepository.pause();
                } else {
                  await songRepository.setCurrentSong(widget.song);
                  songRepository.play();
                }
              },
              child: widget.asStickyNotification
                  ? Icon(
                      icon,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      size: 40,
                    )
                  : NeumorphicIcon(
                      icon,
                      style: NeumorphicStyle(
                        color: Theme.of(context).shadowColor,
                      ),
                      size: 40,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
