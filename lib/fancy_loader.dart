import 'package:flutter/material.dart';

enum AnimationType {
  gradient,
  pulsing,
  rotating,
}

class FancyLoader extends StatefulWidget {
  final AnimationType animationType;
  final double size;
  final Duration duration;

  const FancyLoader({super.key, 
    this.animationType = AnimationType.gradient,
    this.size = 40.0,
    this.duration = const Duration(milliseconds: 800),
  });

  @override
  _FancyLoaderState createState() => _FancyLoaderState();
}

class _FancyLoaderState extends State<FancyLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    switch (widget.animationType) {
      case AnimationType.gradient:
        _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
        break;
      case AnimationType.pulsing:
        _animation = Tween(begin: 1.0, end: 2.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
        );
        break;
      case AnimationType.rotating:
        _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
        break;
    }

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          switch (widget.animationType) {
            case AnimationType.gradient:
              return Container(
                width: widget.size * 1.5,
                height: widget.size,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(_animation.value),
                      Colors.green.withOpacity(_animation.value),
                    ],
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(widget.size / 2),
                ),
              );
            case AnimationType.pulsing:
              return Container(
                width: widget.size * _animation.value,
                height: widget.size * _animation.value,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
              );
            case AnimationType.rotating:
              return Transform.rotate(
                angle: _animation.value * (3.1415927 * 2.0), // Full rotation
                child: Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.green.withOpacity(_animation.value),
                        Colors.red.withOpacity(_animation.value),
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
