import 'package:cobras_e_escadas/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _animation = Tween<double>(begin: 150, end: 310).animate(_controller);
    _animation
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed)
          Future.delayed(Duration(seconds: 2)).then(
              (value) => Navigator.pushReplacementNamed(context, '/start'));
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: SnackImages.background1,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image(
            height: _animation.value,
            image: SnackImages.logo,
          ),
        ),
      ),
    );
  }
}
