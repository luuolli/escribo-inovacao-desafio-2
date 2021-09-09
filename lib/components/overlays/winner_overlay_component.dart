import 'package:cobras_e_escadas/constants/colors.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class WinnerOverlayWidget extends StatefulWidget {
  const WinnerOverlayWidget({Key? key}) : super(key: key);

  @override
  _WinnerOverlayWidgetState createState() => _WinnerOverlayWidgetState();
}

class _WinnerOverlayWidgetState extends State<WinnerOverlayWidget> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5)).then(
      (value) => Navigator.pop(context),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: SnackColors.accent,
      child: Center(
        child: FlareActor(
          'assets/flare-animations/winner.flr',
          animation: 'show',
        ),
      ),
    );
  }
}
