import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:gameboy_tetris/Engine/game_engine.dart';

class GameController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: DirectionController(),
                ),
                Spacer(flex: 1),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
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

const Size _DIRECTION_BUTTON_SIZE = const Size(40, 40);

const Size _SYSTEM_BUTTON_SIZE = const Size(28, 28);

const double _DIRECTION_SPACE = 16;

const double _iconSize = 16;

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
                  _Button(
                      enableLongPress: false,
                      size: _DIRECTION_BUTTON_SIZE,
                      onTap: () {
                        Game.of(context).rotate();
                      }),
                ],
              ),
              SizedBox(height: _DIRECTION_SPACE*0.5),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _Button(
                      size: _DIRECTION_BUTTON_SIZE,
                      onTap: () {
                        Game.of(context).left();
                      }),
                  SizedBox(width: _DIRECTION_SPACE*2),
                  _Button(
                    size: _DIRECTION_BUTTON_SIZE,
                    onTap: () {
                      Game.of(context).right();
                    },
                  ),
                ],
              ),
              SizedBox(height: _DIRECTION_SPACE*0.5),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _Button(
                    size: _DIRECTION_BUTTON_SIZE,
                    onTap: () {
                      Game.of(context).down();
                    },
                  ),
                ],
              ),
            ],
          ),

      ],
    );
  }
}

class SystemButtonGroup extends StatelessWidget {
  static const _systemButtonColor = const Color(0xFF2dc421);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _Description(
            text: "SOUNDS",
            child: _Button(
                size: _SYSTEM_BUTTON_SIZE,
                color: _systemButtonColor,
                enableLongPress: false,
                onTap: () {
                  Game.of(context).soundSwitch();
                }),
          ),
          _Description(
            text: "PAUSE/RESUME",
            child: _Button(
                size: _SYSTEM_BUTTON_SIZE,
                color: _systemButtonColor,
                enableLongPress: false,
                onTap: () {
                  Game.of(context).pauseOrResume();
                }),
          ),
          _Description(
            text: "RESET",
            child: _Button(
                size: _SYSTEM_BUTTON_SIZE,
                enableLongPress: false,
                color: Colors.red,
                onTap: () {
                  Game.of(context).reset();
                }),
          )
        ],
      ),
    );
  }
}

class AButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Description(
      text: '',
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _Button(
                enableLongPress: false,
                size: Size(50, 50),
                onTap: () {
                  Game.of(context).drop();
                }),
            const Text('A', style: TextStyle(color: Color(0xFF757575), fontSize: 25)),
          ],
        ),
    );
  }
}

class BButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Description(
      text: '',
      direction: AxisDirection.up,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _Button(
              enableLongPress: false,
              size: Size(50, 50),
              onTap: () {
                Game.of(context).drop();
              }),
          const Text('B', style: TextStyle(color: Color(0xFF757575), fontSize: 25)),
        ],
      ),
    );
  }
}

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
                BButton(),
                SizedBox(width: _DIRECTION_SPACE),
                AButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Button extends StatefulWidget {
  final Size size;
  final Widget? icon;

  final VoidCallback onTap;

  ///the color of button
  final Color color;
  final bool enableLongPress;

  const _Button({
    Key? key,
    required this.size,
    required this.onTap,
    this.icon,
    this.color = Colors.black87,
    this.enableLongPress = true,
  }) : super(key: key);

  @override
  _ButtonState createState() {
    return new _ButtonState();
  }
}

///show a hint text for child widget
class _Description extends StatelessWidget {
  final String text;

  final Widget child;

  final AxisDirection direction;

  const _Description({
    Key? key,
    required this.text,
    this.direction = AxisDirection.down,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget;
    switch (direction) {
      case AxisDirection.right:
        widget = Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[child, SizedBox(width: 8), Text(text)]);
        break;
      case AxisDirection.left:
        widget = Row(
          children: <Widget>[Text(text), SizedBox(width: 8), child],
          mainAxisSize: MainAxisSize.min,
        );
        break;
      case AxisDirection.up:
        widget = Column(
          children: <Widget>[Text(text), SizedBox(height: 8), child],
          mainAxisSize: MainAxisSize.min,
        );
        break;
      case AxisDirection.down:
        widget = Column(
          children: <Widget>[child, SizedBox(height: 8), Text(text)],
          mainAxisSize: MainAxisSize.min,
        );
        break;
    }
    return DefaultTextStyle(
      child: widget,
      style: TextStyle(fontSize: 12, color: Colors.black),
    );
  }
}

class _ButtonState extends State<_Button> {
  Timer? _timer;

  bool _tapEnded = false;

  late Color _color;

  @override
  void didUpdateWidget(_Button oldWidget) {
    super.didUpdateWidget(oldWidget);
    _color = widget.color;
  }

  @override
  void initState() {
    super.initState();
    _color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _color,
      elevation: 2,
      shape: CircleBorder(),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) async {
          setState(() {
            _color = widget.color.withOpacity(0.5);
          });
          if (_timer != null) {
            return;
          }
          _tapEnded = false;
          widget.onTap();
          if (!widget.enableLongPress) {
            return;
          }
          await Future.delayed(const Duration(milliseconds: 300));
          if (_tapEnded) {
            return;
          }
          _timer = Timer.periodic(const Duration(milliseconds: 60), (t) {
            if (!_tapEnded) {
              widget.onTap();
            } else {
              t.cancel();
              _timer = null;
            }
          });
        },
        onTapCancel: () {
          _tapEnded = true;
          _timer?.cancel();
          _timer = null;
          setState(() {
            _color = widget.color;
          });
        },
        onTapUp: (_) {
          _tapEnded = true;
          _timer?.cancel();
          _timer = null;
          setState(() {
            _color = widget.color;
          });
        },
        child: SizedBox.fromSize(
          size: widget.size,
        ),
      ),
    );
  }
}
