import 'package:cobras_e_escadas/models/models.dart';
import 'package:cobras_e_escadas/models/player_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PlayerWidget extends StatefulWidget {
  final Player player;
  final double sizeTile;
  final List<Position> postionsToAnimate;

  PlayerWidget({
    Key? key,
    required this.player,
    required this.sizeTile,
    required this.postionsToAnimate,
  }) : super(key: key);

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _movimentsAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.postionsToAnimate.length),
    );

    _movimentsAnimation = Tween<int>(
      begin: 0,
      end: widget.postionsToAnimate.length,
    ).animate(_animationController);

    _movimentsAnimation.addListener(() {
      setState(() {});
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _movimentsAnimation,
        builder: (context, snapshot) {
          return Positioned(
            left: (widget.player.positionsToAnimate[_movimentsAnimation.value]
                    .axisX) *
                widget.sizeTile,
            bottom: (widget.player.positionsToAnimate[_movimentsAnimation.value]
                    .axisY) *
                widget.sizeTile,
            child: Transform.scale(
              scale: 1,
              child: Container(
                width: widget.sizeTile,
                height: widget.sizeTile,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: widget.player.image,
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
