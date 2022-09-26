part of 'page_portrait.dart';

class PageLand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: BACKGROUND_COLOR,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 32.h,
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Expanded(child: SystemButtonGroup()),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: 9.h),
                      child: ABController(),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(width: 35.h, child: Screen(width: 70.w)),
              SizedBox(
                width: 32.h,
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    DirectionController(),
                    Spacer(),
                    //   SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
