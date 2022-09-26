import 'package:flutter/material.dart';
import 'package:gameboy_tetris/Control/Button.dart';
import 'package:gameboy_tetris/Control/ButtonDescription.dart';
import 'package:gameboy_tetris/constants.dart';
import 'package:gameboy_tetris/Engine/game_engine.dart';
import 'package:sizer/sizer.dart';

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
                shape: CircleBorder(),
                size: Constants.SYSTEM_BUTTON_SIZE,
                color: Constants.SYSTEM_BUTTON_COLOR,
                enableLongPress: false,
                onTap: () {
                  Game.of(context).soundSwitch();
                }),
          ),
          SizedBox(width: 1.w),
          Description(
            text: "PAUSE/RESUME",
            child: Button(
                shape: CircleBorder(),
                size: Constants.SYSTEM_BUTTON_SIZE,
                color: Constants.SYSTEM_BUTTON_COLOR,
                enableLongPress: false,
                onTap: () {
                  Game.of(context).pauseOrResume();
                }),
          ),
          SizedBox(width: 1.w),
          Description(
            text: "RESET",
            child: Button(
                shape: CircleBorder(),
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
