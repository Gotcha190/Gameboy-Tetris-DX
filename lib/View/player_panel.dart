import 'package:flutter/material.dart';
import 'package:gameboy_tetris/Material/bricks.dart';
import 'package:gameboy_tetris/Material/images.dart';
import 'package:gameboy_tetris/Engine/game_engine.dart';
import 'package:sizer/sizer.dart';

double _PLAYER_PANEL_PADDING = 1.1.w;

Size getBrickSizeForScreenWidth(double width) {
  return Size.square((width - _PLAYER_PANEL_PADDING) / GAME_PAD_MATRIX_W);
}

///the matrix of player content
class PlayerPanel extends StatelessWidget {
  //the size of player panel
  final Size size;

  PlayerPanel({
    Key? key,
    required double width,
  })  : assert(width != 0),
        size = Size(width, width * 2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Container(
        //padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Stack(
          children: <Widget>[
            _PlayerPad(),
            _GameUninitialized(),
          ],
        ),
      ),
    );
  }
}

class _PlayerPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: GameState.of(context).data.map((list) {
        return Row(
          children: list.map((b) {
            return b == 1
                ? const Brick.normal()
                : b == 2
                    ? const Brick.highlight()
                    : const Brick.empty();
          }).toList(),
        );
      }).toList(),
    );
  }
}

class _GameUninitialized extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (GameState.of(context).states == GameStates.none) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconDragon(animate: true),
            SizedBox(height: 2.h),

            ///Space between Dino and text
            Text(
              "Gameboy: Tetris DX",
              style: TextStyle(fontSize: 12.sp),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
