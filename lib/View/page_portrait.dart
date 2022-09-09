import 'package:flutter/material.dart';
import 'package:gameboy_tetris/main.dart';
import 'package:gameboy_tetris/Control/MainController.dart';
import 'package:gameboy_tetris/Control/ABController.dart';
import 'package:gameboy_tetris/Control/DirectionController.dart';
import 'package:gameboy_tetris/Control/SystemButtonsController.dart';
import 'package:gameboy_tetris/View/screen.dart';

part 'page_land.dart';

class PagePortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; /// Phone Size
    final screenW = size.width * 0.7;

    return SizedBox.expand(
      child: Container(
        color: BACKGROUND_COLOR,
        child: Padding(
          padding: MediaQuery.of(context).padding,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: ((screenW * 0.6)- 10) * 2  + 45 * 3,
                width: screenW + 45 * 2 + 8,
                child: Stack(
                  alignment: Alignment.topCenter,
                  fit: StackFit.loose,
                  children: [
                    _ScreenDecoration(child: Screen(width: screenW)),
                    Container(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      alignment: Alignment.bottomCenter,
                      child: Text("GAME BOY",
                          style: TextStyle(color: Color(0xFF557C7B), fontSize: 25)),
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
          padding: const EdgeInsets.all(3),
          color: SCREEN_BACKGROUND,
          child: child,
        ),
      ),
    );
  }
}
