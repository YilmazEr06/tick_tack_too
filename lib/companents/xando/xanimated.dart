import 'package:flutter/material.dart';

class createx extends StatefulWidget {
  const createx({
    super.key,
    required this.top,
    required this.left,
    required this.maxsize,
    required this.minsize,
    required this.colors,
  });
  final double top;
  final double left;
  final double maxsize;
  final double minsize;
  final List<Color> colors;

  @override
  State<createx> createState() => _createoState();
}

class _createoState extends State<createx> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation animation;
  late Gradient gradient;

   @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  void initState() {
    gradient =  LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: widget.colors);
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 15));
    animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) _controller.forward();
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: widget.top,
        left: widget.left,
        child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => gradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Text(
          "X",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: widget.maxsize-(widget.maxsize-widget.minsize)*animation.value,
            fontFamily: "ShadowsIntoLight-Regular"),
        ),
        ));
  }
}
