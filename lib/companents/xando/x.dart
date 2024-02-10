import 'package:flutter/material.dart';

class createxnoanimation extends StatelessWidget {
  const createxnoanimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Gradient gradient = const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [Colors.black, Color.fromARGB(255, 59, 82, 255)]);
    return Stack(children: [
      Positioned(
        top: -35,
        left: 24,
        child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => gradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: const Text(
            "X",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
                fontSize: 120,
                fontFamily: "ShadowsIntoLight-Regular"),
          ),
        ),
      ),
    ]);
  }
}
