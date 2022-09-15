import 'package:flutter/material.dart';

const _COLOR_NORMAL = Colors.black87;

const _COLOR_NULL = Colors.black12;

const _COLOR_HIGHLIGHT = Color(0xFF560000);

class BrickSize extends InheritedWidget {
  const BrickSize({
    Key? key,
    required this.size,
    required Widget child,
  }) : super(key: key, child: child);

  final Size size;

  static BrickSize of(BuildContext context) {
    final brickSize = context.dependOnInheritedWidgetOfExactType<BrickSize>();
    assert(brickSize != null, "....");
    return brickSize!;
  }

  @override
  bool updateShouldNotify(BrickSize old) {
    return old.size != size;
  }
}

///the basic brick for game panel
class Brick extends StatelessWidget {
  final Color color;

  const Brick._({Key? key, required this.color}) : super(key: key);

  const Brick.normal() : this._(color: _COLOR_NORMAL);

  const Brick.empty() : this._(color: _COLOR_NULL);

  const Brick.highlight() : this._(color: _COLOR_HIGHLIGHT);

  @override
  Widget build(BuildContext context) {
    final width = BrickSize.of(context).size.width;
    return SizedBox.fromSize(
      size: BrickSize.of(context).size,
      child: Container(
        margin: EdgeInsets.all(0.05 * width),
        padding: EdgeInsets.all(0.1 * width),
        decoration: BoxDecoration(
            border: Border.all(width: 0.10 * width, color: color)),
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
