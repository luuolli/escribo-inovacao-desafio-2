import 'package:cobras_e_escadas/constants/colors.dart';
import 'package:flutter/material.dart';

class TurnMessageOverlayWidget extends StatefulWidget {
  final String message;
  const TurnMessageOverlayWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  _TurnMessageOverlayWidgetState createState() =>
      _TurnMessageOverlayWidgetState();
}

class _TurnMessageOverlayWidgetState extends State<TurnMessageOverlayWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _moveUpAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _moveUpAnimation = Tween<double>(begin: 0, end: 100).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          await Future.delayed(Duration(seconds: 1)).then(
            (value) => Navigator.pop(context),
          );
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: AnimatedBuilder(
          animation: _moveUpAnimation,
          builder: (context, _) {
            return Transform.translate(
              offset: Offset(0, _moveUpAnimation.value),
              child: Container(
                padding: EdgeInsets.all(40),
                color: SnackColors.blueDark.withOpacity(0.2),
                child: Text(
                  widget.message,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: SnackColors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
