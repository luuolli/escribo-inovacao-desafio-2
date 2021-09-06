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

    _animation = Tween<double>(begin: 100, end: 180).animate(_controller);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        Future.delayed(Duration(seconds: 2))
            .then((value) => Navigator.pushReplacementNamed(context, '/start'));
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFFD9F582),
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (_, widget) {
            return Image(
              width: _animation.value,
              image: SnackImages.logo,
            );
          },
        ),
      ),
    );
  }
}
