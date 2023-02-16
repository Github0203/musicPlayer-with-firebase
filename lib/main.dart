import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:music_player_intern/Screens/musicList.dart';
import 'package:music_player_intern/Screens/uploadSong.dart';
import 'firebase_options.dart';

import 'Screens/musicScreen.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';


import 'package:music_player_intern/thuvien/loading/custom_animation.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MusicApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}



class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, 
        home: const MusicList(),
        builder: EasyLoading.init(),
        );
  }
}
