import 'package:flutter/material.dart';

class sequencebar extends StatefulWidget {
  const sequencebar({
    super.key, required this.whichnext,
  });
  final bool whichnext;
  @override
  State<sequencebar> createState() => _sequencebarState();
}

class _sequencebarState extends State<sequencebar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: 150,
      width: MediaQuery.of(context).size.width,
      top: MediaQuery.of(context).size.height-120,
      child: Container(
        alignment: Alignment.center,
        color: const Color.fromARGB(0, 0, 0, 0),
        child: RichText(
          textAlign: TextAlign.center,
          text:  TextSpan(children: [
            TextSpan(
              text: 'Mavi    ',
              style: TextStyle(
                  color: widget.whichnext ? Color.fromARGB(255, 0, 139, 253):Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: "ProtestRevolution-Regular"),
            ),
            TextSpan(
              text: 'Kırmızı',
              style: TextStyle(
                  color: widget.whichnext ? Colors.black: Color.fromARGB(255, 253, 2, 2),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: "ProtestRevolution-Regular"),
            ),
          ]),
        ),
      ),
    );
  }
}
