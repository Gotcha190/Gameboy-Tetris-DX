import 'package:flutter/material.dart';
import 'package:gameboy_tetris/Control/RoundButton.dart';
import 'package:gameboy_tetris/Control/ButtonDescription.dart';
import 'package:gameboy_tetris/Control/control_constants.dart';
import 'package:gameboy_tetris/Engine/game_engine.dart';

class ABController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Row(
              children: [
                BButton(),
                SizedBox(width: Constants.DIRECTION_SPACE),
                AButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Description(
      text: '',
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Button(
              enableLongPress: false,
              size: Size(50, 50),
              onTap: () {
                Game.of(context).drop();
              }),
          const Text('A',
              style: TextStyle(color: Constants.BUTTON_TEXT_COLOR, fontSize: 25)),
        ],
      ),
    );
  }
}

class BButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Description(
      text: '',
      direction: AxisDirection.up,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Button(
              enableLongPress: false,
              size: Size(50, 50),
              onTap: () {
                Game.of(context).drop();
              }),
          const Text('B',
              style: TextStyle(
                  color: Constants.BUTTON_TEXT_COLOR, fontSize: 25))
        ],
      ),
    );
  }
}
