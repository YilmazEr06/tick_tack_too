import 'package:flutter/material.dart';
import 'package:tick_tack_too/firebase/firebase.dart';
import 'package:tick_tack_too/companents/xando/oanimated.dart';
import 'package:tick_tack_too/companents/xando/xanimated.dart';

import 'package:tick_tack_too/screens/onlinemode/gamescreen/companents/offline_mode_bar.dart';
import 'package:tick_tack_too/screens/onlinemode/gamescreen/companents/sequence.dart';

import 'companents/onlineiizgara.dart';

class screen extends StatefulWidget {
  const screen({super.key});
  @override
  State<screen> createState() => modescreenstate();
}

// ignore: camel_case_types
class modescreenstate extends State<screen> {
  bool whichnext = false;
  int skoro=0;
  int skorx=0;
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    
    next() {
      setState(() {
       whichnext=!whichnext;
      });
    }
    check(Map map) {
      setState(() {
      
      });
    }
     skor(Map map) {
      setState(() {
        skoro= map["o"];
       skorx=map["x"];
      });
    }
   
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        
        createx(
            top: height * 0.2,
            left: width * 0.05,
            maxsize: 150,
            minsize: 80,
            colors: const [Colors.yellow, Colors.black]),
        createo(
            top: height * 0.5,
            left: width * 0.1,
            maxsize: 100,
            minsize: 80,
            colors: const [Colors.yellow, Colors.black]),
        createx(
            top: height * 0.7,
            left: width * 0.2,
            maxsize: 150,
            minsize: 80,
            colors: const [Colors.yellow, Colors.black]),
        createo(
            top: height * 0.4,
            left: width * 0.4,
            maxsize: 100,
            minsize: 80,
            colors: const [Colors.yellow, Colors.black]),
        createx(
            top: height * 0.4,
            left: width * 0.8,
            maxsize: 150,
            minsize: 80,
            colors: const [Colors.yellow, Colors.black]),
        createo(
            top: height * 0.2,
            left: width * 0.6,
            maxsize: 100,
            minsize: 80,
            colors: const [Colors.yellow, Colors.black]),
        createx(
            top: height * 0.02,
            left: width * 0.8,
            maxsize: 150,
            minsize: 80,
            colors: const [Colors.yellow, Colors.black]),
        createo(
            top: height * 0.04,
            left: width * 0.1,
            maxsize: 100,
            minsize: 80,
            colors: const [Colors.yellow, Colors.black]),
        createx(
            top: height * 0.6,
            left: width * 0.7,
            maxsize: 150,
            minsize: 80,
            colors: const [Colors.yellow, Colors.black]),
        createo(
            top: height * 0.79,
            left: width * 0.8,
            maxsize: 100,
            minsize: 80,
            colors: const [Colors.yellow, Colors.black]),
        const onlinegamelogo(),
        Onlinesequencebar(whichnext: whichnext,skorx: skorx,skoro: skoro,),
        createonlineizgara(
          top: 20,
          left: 15,
          nextuser: next,
          next: whichnext,
          check: check,
          seeskor:skor ,
        ),
      ],
    ));
  }
}
