import 'package:flutter/material.dart';
import 'package:gameboy_tetris/Control/Button.dart';
import 'package:gameboy_tetris/Control/control_constants.dart';
import 'package:gameboy_tetris/Engine/game_engine.dart';
import 'package:sizer/sizer.dart';

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
                Padding(
                  padding: EdgeInsets.only(top: 2.5.h),
                  child: Button(
                      shape: CircleBorder(),
                      text: Text('B',
                          style: TextStyle(
                              color: Constants.BUTTON_TEXT_COLOR,
                              fontSize: 20.sp)),
                      enableLongPress: false,
                      size: Size(13.w, 13.w),
                      onTap: () {
                        Game.of(context).drop();
                      }),
                ),
                SizedBox(width: Constants.DIRECTION_SPACE),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.5.h),
                  child: Button(
                      shape: CircleBorder(),
                      text: Text('A',
                          style: TextStyle(
                              color: Constants.BUTTON_TEXT_COLOR,
                              fontSize: 20.sp)),
                      enableLongPress: false,
                      size: Size(13.w, 13.w),
                      onTap: () {
                        Game.of(context).drop();
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
