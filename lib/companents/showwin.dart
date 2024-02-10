import 'package:flutter/material.dart';


class Createwhowin extends StatefulWidget {
  final controller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final String whowin;

  Createwhowin({super.key, required this.whowin,   });

  @override
  State<Createwhowin> createState() => _MyAppState();
}

class _MyAppState extends State<Createwhowin> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   

    return AlertDialog(
      title: Text( "Edit todo" ),
      content: Text(widget.whowin),
  
    );
  }
}
