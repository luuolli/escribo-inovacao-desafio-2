import 'package:audioplayers/audioplayers.dart';
import 'package:cobras_e_escadas/constants/colors.dart';
import 'package:cobras_e_escadas/constants/images.dart';
import 'package:cobras_e_escadas/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  AssetImage _choiseCharterPlayer1 = SnackCharters.charter1;
  final CobraEscadas cobraEscadas = CobraEscadas();

  final AudioCache sound = AudioCache();
  Future<AudioPlayer> playMusic() async {
    return await sound.loop(
      'sounds/starter-sound.mp3',
      stayAwake: true,
      mode: PlayerMode.LOW_LATENCY,
      volume: 0.1,
    );
  }

  void chooseCharter(AssetImage choise) {
    setState(() {
      _choiseCharterPlayer1 = choise;
    });
  }

  @override
  void initState() {
    // sound.clearAll();
    // playMusic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SnackColors.accent,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Jogador 1 escolha seu avatar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: SnackColors.blueDark,
                      backgroundImage: SnackCharters.charter1,
                    ),
                    onPressed: () {
                      chooseCharter(SnackCharters.charter1);
                    }),
                CupertinoButton(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: SnackColors.blueDark,
                      backgroundImage: SnackCharters.charter2,
                    ),
                    onPressed: () {
                      chooseCharter(SnackCharters.charter2);
                    }),
              ],
            ),
            SizedBox(height: 40),
            CupertinoButton(
              color: SnackColors.blueDark,
              child: Text('Jogar'),
              onPressed: () async {
                cobraEscadas.startGame(_choiseCharterPlayer1);
                await Navigator.pushReplacementNamed(
                  context,
                  '/game',
                ).catchError(
                  (onError) {
                    print('página inexistente');
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    sound.clearAll();
    super.dispose();
  }
}
