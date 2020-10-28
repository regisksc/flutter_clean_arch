import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/app/core/utils/constants/visual_assets.dart';
import 'package:lottie/lottie.dart';

class LoaderWidget extends StatefulWidget {
  @override
  _LoaderWidgetState createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 3500));
    animation = Tween<double>(begin: 0.3, end: 0.6).animate(controller)
      // #enddocregion print-state
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, child) {
            return Opacity(
              // duration: Duration(milliseconds: 400),
              opacity: animation.value as double,
              child: Container(
                color: Colors.black,
              ),
            );
          },
        ),
        Center(
          child: Lottie.asset(
            VisualAssets.whiteBackgrounHorizontalLogo,
            alignment: Alignment.center,
            animate: true,
            repeat: true,
            height: 80,
            width: 80,
          ),
        )
      ],
    );
  }
}
