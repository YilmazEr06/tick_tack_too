import 'package:flutter/material.dart';

class createo extends StatefulWidget {
  const createo({
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
  State<createo> createState() => _createoState();
}

class _createoState extends State<createo> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation animation;
  late Gradient gradient;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gradient =  LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: widget.colors);
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
        child:ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => gradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Text(
          "O",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: widget.maxsize-(widget.maxsize-widget.minsize)*animation.value,
            fontFamily: "ShadowsIntoLight-Regular"),
        ),
        ));
  }
}


// ignore: camel_case_types
class circlepainter extends CustomPainter{
  circlepainter({required this.raidus, required this.maxsize,required this.minsize, required this.colors });
  final  double raidus;
  final double maxsize;
  final double minsize;
  
  final List<Color> colors;
 
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
    ..shader= LinearGradient(
      colors: colors,
      begin: Alignment.bottomRight,
      end: Alignment.topLeft).createShader(Rect.fromCircle(center: Offset(0, 0), radius:  maxsize-(maxsize-minsize)*raidus))
      ..color = Colors.blueAccent
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke;
    
    
    canvas.drawCircle(Offset.zero, maxsize-(maxsize-minsize)*raidus, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }

}

