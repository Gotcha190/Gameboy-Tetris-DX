import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:gameboy_tetris/Engine/block.dart';
import 'package:gameboy_tetris/Engine/game_engine.dart';
import 'package:gameboy_tetris/Material/briks.dart';
import 'package:gameboy_tetris/Material/images.dart';
import 'package:sizer/sizer.dart';

class StatusPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 10.w,
      padding: EdgeInsets.all(1.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Points",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.sp)),
          SizedBox(height: 1.h),
          Number(number: GameState.of(context).points),
          SizedBox(height: 1.5.h),
          Text("Cleans",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.sp)),
          SizedBox(height: 1.h),
          Number(number: GameState.of(context).cleared),
          SizedBox(height: 1.5.h),
          Text("Level",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.sp)),
          SizedBox(height: 1.h),
          Number(number: GameState.of(context).level),
          SizedBox(height: 1.5.h),
          Text("Next",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.sp)),
          SizedBox(height: 1.h),
          _NextBlock(),
          Spacer(),
          _GameStatus(),
        ],
      ),
    );
  }
}

class _NextBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<List<int>> data = [List.filled(4, 0), List.filled(4, 0)];
    //TODO: Blocks in status_panel
    // final next = BLOCK_SHAPES[GameState.of(context).next.type]!;
    // for (int i = 0; i < next.length; i++) {
    //   for (int j = 0; j < next[i].length; j++) {
    //     data[i][j] = next[i][j];
    //   }
    // }
    return Column(
      children: data.map((list) {
        return Row(
          children: list.map((b) {
            return b == 1 ? const Brik.normal() : const Brik.empty();
          }).toList(),
        );
      }).toList(),
    );
  }
}

class _GameStatus extends StatefulWidget {
  @override
  _GameStatusState createState() {
    return new _GameStatusState();
  }
}

class _GameStatusState extends State<_GameStatus> {
  Timer? _timer;

  bool _colonEnable = true;

  int _minute = 0;

  int _hour = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      setState(() {
        _colonEnable = !_colonEnable;
        _minute = now.minute;
        _hour = now.hour;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.5.h,
      width: 25.w,
      child: Row(
        children: <Widget>[
          IconSound(enable: GameState.of(context).muted),
          SizedBox(width: 1.w),
          IconPause(enable: GameState.of(context).states == GameStates.paused),
          Spacer(),
          Number(number: _hour, length: 2, padWithZero: true),
          IconColon(enable: _colonEnable),
          Number(number: _minute, length: 2, padWithZero: true),
        ],
      ),
    );
  }
}
