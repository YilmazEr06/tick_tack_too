import 'package:flutter/material.dart';



class createonoanimation extends StatelessWidget {
  const createonoanimation({
    super.key,
  });
 
  @override
  Widget build(BuildContext context) {
    Gradient gradient =  LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [Colors.black,const Color.fromARGB(255, 255, 59, 59)]);
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
            "O",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 120,
                fontFamily: "ShadowsIntoLight-Regular"),
          ),
        ),
      ),
    ]);
  }
}

