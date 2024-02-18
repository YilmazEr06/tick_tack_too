import 'package:flutter/material.dart';
import 'package:tick_tack_too/firebase/firebase.dart';

class Onlinesequencebar extends StatefulWidget {
  const Onlinesequencebar({
    super.key,
    required this.whichnext,
    required this.skorx,
    required this.skoro,
  });
  final bool whichnext;
  final int skorx;
  final int skoro;

  @override
  State<Onlinesequencebar> createState() => _sequencebarState();
}

class _sequencebarState extends State<Onlinesequencebar> {
  String who = "X";
  @override
  void initState() {
    firebasehlp().currentgameid.then((value) {
      firebasehlp().gameinfo(value).then((value) {
        setState(() {
          if (value!["X"]["id"] == firebasehlp().currentuserid) {
            who = "X";
          } else {
            who = "O";
          }
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          (who != "O")
              ? Positioned(
                  top: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    alignment: Alignment.center,
                    color: const Color.fromARGB(0, 0, 0, 0),
                    child: x(widget: widget),
                  ),
                )
              : Positioned(
                  top: MediaQuery.of(context).size.height - 130,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    color: const Color.fromARGB(0, 0, 0, 0),
                    child: x(widget: widget),
                  ),
                ),
          (who == "X")
              ? Positioned(
                  top: MediaQuery.of(context).size.height - 130,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    color: Color.fromARGB(0, 0, 0, 0),
                    child: o(widget: widget),
                  ),
                )
              : Positioned(
                  top: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    color: Color.fromARGB(0, 0, 0, 0),
                    child: o(widget: widget),
                  ),
                )
        ],
      ),
    );
  }
}

class x extends StatelessWidget {
  const x({
    super.key,
    required this.widget,
  });

  final Onlinesequencebar widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${widget.skorx}",
          style: const TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: "ProtestRevolution-Regular"),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: 'Mavi    ',
              style: TextStyle(
                  color: widget.whichnext
                      ? Color.fromARGB(255, 0, 139, 253)
                      : Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: "ProtestRevolution-Regular"),
            ),
          ]),
        ),
      ],
    );
  }
}

class o extends StatelessWidget {
  const o({
    super.key,
    required this.widget,
  });

  final Onlinesequencebar widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${widget.skorx}",
          style: const TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: "ProtestRevolution-Regular"),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: 'Kırmızı',
              style: TextStyle(
                  color: widget.whichnext
                      ? Colors.black
                      : Color.fromARGB(255, 253, 2, 2),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: "ProtestRevolution-Regular"),
            ),
          ]),
        ),
      ],
    );
  }
}
