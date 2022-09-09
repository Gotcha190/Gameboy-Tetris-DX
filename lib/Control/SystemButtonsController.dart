import 'package:flutter/material.dart';
import 'package:gameboy_tetris/Control/RoundButton.dart';
import 'package:gameboy_tetris/Control/ButtonDescription.dart';
import 'package:gameboy_tetris/Control/control_constants.dart';
import 'package:gameboy_tetris/Engine/game_engine.dart';

class SystemButtonGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Description(
            text: "SOUNDS",
            child: Button(
                size: Constants.SYSTEM_BUTTON_SIZE,
                color: Constants.SYSTEM_BUTTON_COLOR,
                enableLongPress: false,
                onTap: () {
                  Game.of(context).soundSwitch();
                }),
          ),
          Description(
            text: "PAUSE/RESUME",
            child: Button(
                size: Constants.SYSTEM_BUTTON_SIZE,
                color: Constants.SYSTEM_BUTTON_COLOR,
                enableLongPress: false,
                onTap: () {
                  Game.of(context).pauseOrResume();
                }),
          ),
          Description(
            text: "RESET",
            child: Button(
                size: Constants.SYSTEM_BUTTON_SIZE,
                enableLongPress: false,
                color: Constants.SYSTEM_BUTTON_RESET_COLOR,
                onTap: () {
                  Game.of(context).reset();
                }),
          )
        ],
      ),
    );
  }
}
