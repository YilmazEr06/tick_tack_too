import 'package:flutter/material.dart';
import 'package:tick_tack_too/screens/modescrenn/companents/Buttons.dart';
import 'package:tick_tack_too/screens/modescrenn/companents/tick_tack_too_bar.dart';
import 'package:tick_tack_too/companents/xando/oanimated.dart';
import 'package:tick_tack_too/companents/xando/xanimated.dart';

class modescreen extends StatefulWidget {
  const modescreen({super.key});
  @override
  State<modescreen> createState() => modescreenstate();
}

// ignore: camel_case_types
class modescreenstate extends State<modescreen> {
 
  @override
  Widget build(BuildContext context) {
     double width= MediaQuery.sizeOf(context).width;
      double height= MediaQuery.sizeOf(context).height;
    return  Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
      createx(top: height*0.2, left: width*0.05, maxsize: 150, minsize: 80, colors:  [Colors.yellow,Colors.black]),
      createo(top: height*0.5, left: width*0.1, maxsize: 100, minsize: 80, colors: [Colors.yellow,Colors.black]),
      createx(top: height*0.7, left: width*0.2, maxsize: 150, minsize: 80, colors:  [Colors.yellow,Colors.black]),
      createo(top: height*0.4, left: width*0.4, maxsize: 100, minsize: 80, colors: [Colors.yellow,Colors.black]),
      createx(top: height*0.4, left: width*0.8, maxsize: 150, minsize: 80, colors:  [Colors.yellow,Colors.black]),
      createo(top: height*0.2, left: width*0.6, maxsize: 100, minsize: 80, colors: [Colors.yellow,Colors.black]),
      createx(top: height*0.02, left: width*0.8, maxsize: 150, minsize: 80, colors:  [Colors.yellow,Colors.black]),
      createo(top: height*0.04, left: width*0.1, maxsize: 100, minsize: 80, colors: [Colors.yellow,Colors.black]),
      createx(top: height*0.6, left: width*0.7, maxsize: 150, minsize: 80, colors:  [Colors.yellow,Colors.black]),
      createo(top: height*0.79, left: width*0.8, maxsize: 100, minsize: 80, colors: [Colors.yellow,Colors.black]),
    const  logo(),
    const  Buttons(),
     
       

      ],
    ));
  }
}

