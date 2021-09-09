import 'package:cobras_e_escadas/constants/colors.dart';
import 'package:cobras_e_escadas/constants/constants.dart';
import 'package:cobras_e_escadas/constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with TickerProviderStateMixin {
  late AnimationController _logoAnimationController;
  late AnimationController _buttonAnimationController;
  late Animation<double> _logoAnimation;
  late Animation<double> _buttonAnimation;


  @override
  void initState() {
    super.initState();
    // playMusic();

    _logoAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _buttonAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _logoAnimation =
        Tween<double>(begin: 310, end: 280).animate(_logoAnimationController);
    _buttonAnimation =
        Tween<double>(begin: 0, end: 1).animate(_buttonAnimationController);

    _logoAnimation
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _buttonAnimationController.forward();
        }
      });

    _buttonAnimation.addListener(() {
      setState(() {});
    });

    _logoAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: SnackImages.background1,
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    height: _logoAnimation.value,
                    image: SnackImages.logo,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80), //animate
                child: Opacity(
                  opacity: _buttonAnimation.value,
                  child: CupertinoButton(
                    color: SnackColors.blueDark,
                    child: Text('Play'),
                    onPressed: () async {
                      await Navigator.pushReplacementNamed(
                        context,
                        '/choose-charter',
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
