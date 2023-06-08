import 'package:flutter/material.dart';

class FlippingWidget extends StatefulWidget {
  final Widget frontContent;
  final Widget backContent;

  FlippingWidget({required this.frontContent, required this.backContent});

  @override
  _FlippingWidgetState createState() => _FlippingWidgetState();
}

class _FlippingWidgetState extends State<FlippingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flip() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isFront = !_isFront;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _flip,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final angle = _animation.value * 180.0;
              return Transform(
                transform:
                    Matrix4.rotationY(angle * (3.1415926535897932 / 180)),
                alignment: Alignment.center,
                child: _isFront ? widget.frontContent : widget.backContent,
              );
            },
          ),
        ),
      ],
    );
  }
}
