import 'package:cobras_e_escadas/pages/game_page.dart';
import 'package:cobras_e_escadas/pages/splash_page.dart';
import 'package:cobras_e_escadas/pages/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/splash': (BuildContext context) => SplashPage(),
        '/start': (BuildContext context) => StartPage(),
        '/game': (BuildContext context) => GamePage(),
      },
      initialRoute: '/splash',
    );
  }
}
