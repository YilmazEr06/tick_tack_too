import 'package:flutter/material.dart';

class Createwhowin extends StatefulWidget {
  final controller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final String whowin;
  final double size;
   final double top;
    final double left;
  Createwhowin({
    super.key,
    required this.whowin,
    required this.size,
     required this.top, 
     required this.left 

  });

  @override
  State<Createwhowin> createState() => _MyAppState();
}

class _MyAppState extends State<Createwhowin> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 190, 190, 153),
      content: Container(
        height: 250,
        width: 550,
        child:  Stack(children: [
           const Positioned(
            left: 40,
            child: Text(
              "Kazanan",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: "ProtestRevolution-Regular"),
            ),
          ),
          Positioned(
            top: widget.top,
            left: widget.left,
              child: Text(
            widget.whowin,
            style:  TextStyle(
                color: Colors.black,
                fontSize: widget.size,
                fontWeight: FontWeight.bold,
                fontFamily: "ProtestRevolution-Regular"),
          ))
        ]),
      ),
    );
  }
}
