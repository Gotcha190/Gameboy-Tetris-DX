import 'package:flutter/material.dart';
import 'package:gameboy_tetris/main.dart';
import 'package:gameboy_tetris/Control/MainController.dart';
import 'package:gameboy_tetris/Control/ABController.dart';
import 'package:gameboy_tetris/Control/DirectionController.dart';
import 'package:gameboy_tetris/Control/SystemButtonsController.dart';
import 'package:gameboy_tetris/View/screen.dart';
import 'package:sizer/sizer.dart';

import '../Control/control_constants.dart';

part 'page_land.dart';

class PagePortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;/// Phone Size
     //final size = Constants.SCREEN_SIZE;
    final screenW = size.width * 0.7;

    return SizedBox.expand(
      child: Container(
        color: BACKGROUND_COLOR,
        child: Padding(
          padding: MediaQuery.of(context).padding,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60.h,//((screenW * 0.6)- 10) * 2  + 45 * 3,
                width: 100.w, //screenW + 45 * 2 + 8,
                child: Stack(
                  alignment: Alignment.topCenter,
                  fit: StackFit.loose,
                  children: [
                    _ScreenDecoration(child: Screen(width: screenW)),
                    Container(
                      padding: EdgeInsets.only(bottom: 3.h),
                      alignment: Alignment.bottomCenter,
                      child: Text("GAME BOY",
                          style: TextStyle(color: Color(0xFF557C7B), fontSize: 8.w)),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 3),
              GameController(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScreenDecoration extends StatelessWidget {
  final Widget child;

  const _ScreenDecoration({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.black, width: SCREEN_BORDER_WIDTH),
          left: BorderSide(color: Colors.black, width: SCREEN_BORDER_WIDTH),
          right: BorderSide(color: Colors.black, width: SCREEN_BORDER_WIDTH),
          bottom:
              BorderSide(color: Colors.black, width: SCREEN_BORDER_WIDTH * 1.5),
        ),
      ),

      ///Display
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
        child: Container(
          color: Constants.SCREEN_BACKGROUND,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 1.w, horizontal: 1.w),
            child: child,
          ),
        ),
      ),
    );
  }
}
