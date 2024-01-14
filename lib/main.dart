import 'package:audio_handler/src/audio_handler.dart';
import 'package:audio_player/repositories/song_repository.dart';
import 'package:audio_player/ui/home/views/home_screen.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

import 'config/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AudioHandler audioHandler = await AudioService.init(
    builder: () => MyAudioHandler(),
    config: const AudioServiceConfig(
        // androidNotificationChannelId: 'com.ryanheise.myapp.channel.audio',
        // androidNotificationChannelName: 'Audio playback',
        // androidNotificationOngoing: true,
        ),
  );
  runApp(MyApp(audioHander: audioHandler));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required AudioHandler audioHander})
      : _audioHandler = audioHander;

  final AudioHandler _audioHandler;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SongRepository>(
          create: (context) =>
              SongRepository(false, audioHandler: _audioHandler),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.theme,
        themeMode: ThemeMode.light,
        home: const HomeScreen(),
      ),
    );
  }
}
