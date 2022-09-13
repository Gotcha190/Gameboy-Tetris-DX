import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gameboy_tetris/Control/RectangleButton.dart';
import 'package:gameboy_tetris/Control/control_constants.dart';
import 'package:gameboy_tetris/Engine/game_engine.dart';
import 'dart:math' as math;
import 'package:sizer/sizer.dart';

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
                Stack(alignment: Alignment.center, children: [
                  Button(
                      enableLongPress: false,
                      size: Constants.DIRECTION_BUTTON_SIZE,
                      onTap: () {
                        Game.of(context).rotate();
                      }),
                  Text("▲",
                      style: TextStyle(
                          color: Constants.BUTTON_TEXT_COLOR, fontSize: 20.sp)),
                ]),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Transform.rotate(
                  angle: math.pi * 1.5,
                  child: Stack(alignment: Alignment.center, children: [
                    Button(
                        size: Constants.DIRECTION_BUTTON_SIZE,
                        onTap: () {
                          Game.of(context).left();
                        }),
                    Text("▲",
                        style: TextStyle(
                            color: Constants.BUTTON_TEXT_COLOR, fontSize: 20.sp)),
                  ]),
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
                  child: Stack(alignment: Alignment.center, children: [
                    Button(
                      size: Constants.DIRECTION_BUTTON_SIZE,
                      onTap: () {
                        Game.of(context).right();
                      },
                    ),
                    Text("▲",
                        style: TextStyle(
                            color: Constants.BUTTON_TEXT_COLOR, fontSize: 20.sp)),
                  ]),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Transform.rotate(
                  angle: math.pi,
                  child: Stack(alignment: Alignment.center, children: [
                    Button(
                      size: Constants.DIRECTION_BUTTON_SIZE,
                      onTap: () {
                        Game.of(context).down();
                      },
                    ),
                    Text("▲",
                        style: TextStyle(
                            color: Constants.BUTTON_TEXT_COLOR, fontSize: 20.sp)),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
