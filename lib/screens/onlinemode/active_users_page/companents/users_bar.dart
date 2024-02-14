import 'package:flutter/material.dart';

class Loginusersbar extends StatelessWidget {
  const Loginusersbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: 150,
      width: MediaQuery.of(context).size.width,
      top: 25,
      child: Container(
        alignment: Alignment.center,
        color: Color.fromARGB(0, 33, 149, 243),
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(children: [
            TextSpan(
              text: 'Kullanıcılar\n',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: "ProtestRevolution-Regular"),
            ),
          
          ]),
        ),
      ),
    );
  }
}
