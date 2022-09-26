import 'package:flutter/material.dart';
import 'package:gameboy_tetris/Control/ABController.dart';
import 'package:gameboy_tetris/Control/DirectionController.dart';
import 'package:gameboy_tetris/Control/SystemButtonsController.dart';
import 'package:gameboy_tetris/constants.dart';
import 'package:sizer/sizer.dart';

class GameController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33.h,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(left: Constants.CONTROLLER_PADDING_LEFT),
                  child: DirectionController(),
                ),
                Spacer(flex: 1),
                Padding(
                  padding: EdgeInsets.only(
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
