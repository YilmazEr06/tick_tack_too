import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    firebasehlp().getgamechange().listen((event) {
      if(event.data()!["current game"].toString().isNotEmpty){
        print("hello ben bir oyundayım");
         Fluttertoast.showToast(
        msg: "Oyun başlıyor",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0

    );
    Navigator.pushNamedAndRemoveUntil(context, '/onlineoyun', (route) => false);
      }
    });
   
    
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
        const button(),
        const userlist(),
        text(width: width, height: height)
      ],
    ));
  }
}

class button extends StatelessWidget {
  const button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 150,
        left: 150,
        child: ElevatedButton(
            onPressed: () {
              firebasehlp().logout();
              Navigator.pushNamedAndRemoveUntil(
                  context, "/modes", (route) => false);
            },
            child: const Text("çıkış")));
  }
}

class text extends StatelessWidget {
  const text({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
      ));
  }
}
