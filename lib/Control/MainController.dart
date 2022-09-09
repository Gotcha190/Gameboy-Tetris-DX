import 'package:flutter/material.dart';
import 'package:gameboy_tetris/Control/ABController.dart';
import 'package:gameboy_tetris/Control/DirectionController.dart';
import 'package:gameboy_tetris/Control/SystemButtonsController.dart';
import 'package:gameboy_tetris/Control/control_constants.dart';

class GameController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constants.CONTROLLER_HEIGHT,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: Constants.CONTROLLER_PADDING_LEFT),
                  child: DirectionController(),
                ),
                Spacer(flex: 1),
                Padding(
                  padding: const EdgeInsets.only(
                      right: Constants.CONTROLLER_PADDING_RIGHT),
                  child: ABController(),
                ),
              ],
            ),
          ),
          Expanded(
            child: SystemButtonGroup(),
          )
        ],
      ),
    );
  }
}
