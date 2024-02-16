import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tick_tack_too/companents/xando/oanimated.dart';
import 'package:tick_tack_too/companents/xando/xanimated.dart';
import 'package:tick_tack_too/firebase/firebase.dart';
import 'package:tick_tack_too/screens/onlinemode/active_users_page/companents/mailicon.dart';
import 'package:tick_tack_too/screens/onlinemode/active_users_page/companents/userlist.dart';

import 'package:tick_tack_too/screens/onlinemode/active_users_page/companents/users_bar.dart';

class Activeusers extends StatefulWidget {
  const Activeusers({super.key});
  @override
  State<Activeusers> createState() => modescreenstate();
}

// ignore: camel_case_types
class modescreenstate extends State<Activeusers> {
  @override
  void initState() {
    print(firebasehlp().currentuserid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

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
        const Loginusersbar(),
        MailIicon(width: width, height: height),
        Positioned(
            top: 150,
            left: 150,
            child: ElevatedButton(
                onPressed: () {
                  firebasehlp().logout();
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/modes", (route) => false);
                },
                child: const Text("çıkış"))),
        const userlist(),
        Positioned(
          left: width-330,
          top: height-75,
          child: const Column(
            children: [
              Text("Davet etmek istediğiniz",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "ProtestRevolution-Regular"),),
              Text("kullanıcıya dokunun",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "ProtestRevolution-Regular"),),
            ],
          ))
      ],
    ));
  }
}
