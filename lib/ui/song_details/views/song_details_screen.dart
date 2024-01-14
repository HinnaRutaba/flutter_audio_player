import 'package:atomsbox/atomsbox.dart';
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
  @override
  Widget build(BuildContext context) {
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    widget.song.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: AppConstants.lg),
              AppText.titleLarge("Now Playing ${widget.song.title}"),
              AppText.bodyMedium("By ${widget.song.artist.name}"),
              const SizedBox(height: AppConstants.lg),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NeuBox(
                    padding: const EdgeInsets.all(AppConstants.md),
                    radius: 50,
                    child: NeumorphicIcon(
                      Icons.skip_previous,
                      size: 40,
                      style: NeumorphicStyle(
                        color: Theme.of(context).shadowColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppConstants.lg),
                  NeuBox(
                    padding: const EdgeInsets.all(AppConstants.md),
                    radius: 50,
                    child: NeumorphicIcon(
                      Icons.play_arrow,
                      size: 40,
                      style: NeumorphicStyle(
                        color: Theme.of(context).shadowColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppConstants.lg),
                  NeuBox(
                    padding: const EdgeInsets.all(AppConstants.md),
                    radius: 50,
                    child: NeumorphicIcon(
                      Icons.skip_next,
                      size: 40,
                      style: NeumorphicStyle(
                        color: Theme.of(context).shadowColor,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          )),
    );
  }
}
