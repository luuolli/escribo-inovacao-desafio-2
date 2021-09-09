import 'package:cobras_e_escadas/models/models.dart';
import 'package:cobras_e_escadas/models/player_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PlayerWidget extends StatefulWidget {
  final Player player;
  final double sizeTile;

  PlayerWidget({
    Key? key,
    required this.player,
    required this.sizeTile,
  }) : super(key: key);

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _movimentsAnimation;

  OffsetPosition get offsetPosition {
    return widget.player.positionsToJump?[_movimentsAnimation.value] ??
        (widget.player.offsetPosition ??
            OffsetPosition(
              position: 1,
              index: 0,
              axisX: 0,
              axisY: 0,
            ));
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
  }

  @override
  void didUpdateWidget(covariant PlayerWidget oldWidget) {
    if (widget.player.positionsToJump != null) {
      animateJump(positionsToJump: widget.player.positionsToJump);
    }
    super.didUpdateWidget(oldWidget);
  }

  void animateJump({List<OffsetPosition>? positionsToJump}) {
    if (positionsToJump == null) return;

    _movimentsAnimation = IntTween(
      begin: 0,
      end: positionsToJump.length - 1,
    ).animate(_animationController)
      ..addListener(() {
        setState(() {
          print(_movimentsAnimation.value);
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.player.offsetPosition = positionsToJump.last;
          widget.player.position = positionsToJump.last.position;
          widget.player.positionsToJump = null;
        }
      });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(
        milliseconds: 3000 ~/ (widget.player.positionsToJump?.length ?? 1),
      ),
      left: offsetPosition.axisX * widget.sizeTile,
      bottom: offsetPosition.axisY * widget.sizeTile,
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
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
