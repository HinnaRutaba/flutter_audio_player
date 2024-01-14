import 'package:atomsbox/atomsbox.dart';
import 'package:audio_player/config/app_color_scheme.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/ui/custom/neu_box.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class SongDetails extends StatefulWidget {
  final Song song;
  const SongDetails({super.key, required this.song});

  @override
  State<SongDetails> createState() => _SongDetailsState();
}

class _SongDetailsState extends State<SongDetails> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.song.title),
        leading: Align(
          //color: Colors.red,
          alignment: Alignment.center,
          child: NeumorphicIcon(
            Icons.arrow_circle_left,
            style: NeumorphicStyle(
              color: Theme.of(context).shadowColor,
            ),
            size: 40,
          ),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              const Spacer(),
              NeuBox(
                radius: 50,
                shape: BoxShape.circle,
                child: Container(
                  width: size.width * 0.60,
                  height: size.width * 0.60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(widget.song.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              AppText.titleLarge("Now Playing ${widget.song.title}"),
              AppText.bodyMedium("By ${widget.song.artist.name}"),
              const Spacer(),
              const NeumorphicProgress(
                percent: 12,
                height: 16,
                style: ProgressStyle(
                  variant: AppColors.shadowColor,
                  accent: AppColors.containerColor,
                ),
              ),
              const SizedBox(height: AppConstants.lg * 2),
              buttonsTray(),
              const Spacer(),
            ],
          )),
    );
  }

  Widget buttonsTray() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconButton(Icons.skip_previous, () {}),
        const SizedBox(width: AppConstants.lg),
        iconButton(
            isPlaying ? Icons.pause : Icons.play_arrow, () {
          setState(() {
            isPlaying = !isPlaying;
          });
        }),
        const SizedBox(width: AppConstants.lg),
        iconButton(Icons.skip_next, () {}),
      ],
    );
  }

  Widget iconButton(IconData icon, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: NeuBox(
        padding: const EdgeInsets.all(AppConstants.md),
        radius: 50,
        child: NeumorphicIcon(
          icon,
          size: 40,
          style: NeumorphicStyle(
            color: Theme.of(context).shadowColor,
          ),
        ),
      ),
    );
  }
}
