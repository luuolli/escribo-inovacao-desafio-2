import 'package:cobras_e_escadas/constants/constants.dart';
import 'package:cobras_e_escadas/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseCharterPage extends StatefulWidget {
  CobraEscadas cobraEscadas;
  ChooseCharterPage({Key? key, required this.cobraEscadas}) : super(key: key);

  @override
  _ChooseCharterPageState createState() => _ChooseCharterPageState();
}

class _ChooseCharterPageState extends State<ChooseCharterPage> {
  AssetImage _choiseCharterPlayer1 = SnackCharters.charter1;

  void chooseCharter(AssetImage choise) {
    setState(() {
      _choiseCharterPlayer1 = choise;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: SnackImages.background1,
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80), //animate
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  child: Opacity(
                    opacity: 1,
                    child: CupertinoButton(
                      color: SnackColors.blueDark,
                      child: Text('Play'),
                      onPressed: () async {
                        widget.cobraEscadas.startGame(_choiseCharterPlayer1);
                        await Navigator.pushReplacementNamed(
                          context,
                          '/game',
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
