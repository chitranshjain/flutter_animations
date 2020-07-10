import 'package:flutter/material.dart';
import 'package:flutteranimations/AnimatedScreen.dart';

class BeatingAnimation extends StatefulWidget {
  @override
  _BeatingAnimationState createState() => _BeatingAnimationState();
}

class _BeatingAnimationState extends State<BeatingAnimation>
    with TickerProviderStateMixin {
  AnimationController _beatingAnimationController;
  Animation _beatingAnimation;

  @override
  void initState() {
    _beatingAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _beatingAnimation = Tween(begin: 130.0, end: 190.0).animate(
      CurvedAnimation(
          curve: Curves.bounceInOut, parent: _beatingAnimationController),
    );

    _beatingAnimationController.forward();

    _beatingAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _beatingAnimationController.repeat();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: secondChild(),
    );
  }

  Widget secondChild() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AnimatedScreen()),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          AnimatedBuilder(
            animation: _beatingAnimationController,
            builder: (context, child) {
              return Center(
                  child: Icon(
                Icons.favorite,
                color: Colors.red,
                size: _beatingAnimation.value,
              ));
            },
          ),
        ],
      ),
    );
  }
}
