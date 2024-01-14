import 'package:atomsbox/atomsbox.dart';
import 'package:audio_player/ui/custom/neu_box.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

import '../../../models/song.dart';

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
        titleSpacing: AppConstants.spaceUnit,
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.spaceUnit),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _TrendingSongsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
