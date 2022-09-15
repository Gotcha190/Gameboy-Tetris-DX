import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gameboy_tetris/Control/Button.dart';
import 'package:gameboy_tetris/Control/control_constants.dart';
import 'package:gameboy_tetris/Engine/game_engine.dart';
import 'dart:math' as math;

import 'package:sizer/sizer.dart';

const ShapeBorder buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.zero,
        topLeft: Radius.circular(5),
        bottomRight: Radius.zero,
        topRight: Radius.circular(5)));

Text buttonText = Text("▲",
    style: TextStyle(color: Constants.BUTTON_TEXT_COLOR, fontSize: 20.sp));

class DirectionController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Button(
                    shape: buttonShape,
                    text: buttonText,
                    enableLongPress: false,
                    size: Constants.DIRECTION_BUTTON_SIZE,
                    onTap: () {
                      Game.of(context).rotate();
                    }),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Transform.rotate(
                  angle: math.pi * 1.5,
                  child: Button(
                      shape: buttonShape,
                      text: buttonText,
                      size: Constants.DIRECTION_BUTTON_SIZE,
                      onTap: () {
                        Game.of(context).left();
                      }),
                ),
                SizedBox(
                  width: Constants.DIRECTION_BUTTON_SIZE.width,
                  height: Constants.DIRECTION_BUTTON_SIZE.height,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Constants.BUTTON_COLOR,
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: math.pi / 2,
                  child: Button(
                    shape: buttonShape,
                    text: buttonText,
                    size: Constants.DIRECTION_BUTTON_SIZE,
                    onTap: () {
                      Game.of(context).right();
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Transform.rotate(
                  angle: math.pi,
                  child: Button(
                    shape: buttonShape,
                    text: buttonText,
                    size: Constants.DIRECTION_BUTTON_SIZE,
                    onTap: () {
                      Game.of(context).down();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
