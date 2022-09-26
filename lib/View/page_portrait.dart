import 'package:flutter/material.dart';
import 'package:gameboy_tetris/main.dart';
import 'package:gameboy_tetris/Control/MainController.dart';
import 'package:gameboy_tetris/Control/ABController.dart';
import 'package:gameboy_tetris/Control/DirectionController.dart';
import 'package:gameboy_tetris/Control/SystemButtonsController.dart';
import 'package:gameboy_tetris/View/screen.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';

part 'page_land.dart';

class PagePortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: BACKGROUND_COLOR,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60.h,
                width: 100.w,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  fit: StackFit.loose,
                  children: [
                    _ScreenDecoration(child: Screen(width: 70.w)),
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.5.h),
                      child: Text("GAME BOY",
                            style: TextStyle(
                                color: Color(0xFF557C7B), fontSize: 8.w)),
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
          top: BorderSide(color: Colors.black, width: Constants.SCREEN_BORDER_WIDTH),
          left: BorderSide(color: Colors.black, width: Constants.SCREEN_BORDER_WIDTH),
          right: BorderSide(color: Colors.black, width: Constants.SCREEN_BORDER_WIDTH),
          bottom: BorderSide(color: Colors.black, width: Constants.SCREEN_BORDER_WIDTH * 1.5),
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
