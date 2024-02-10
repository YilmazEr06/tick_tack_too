import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tick_tack_too/screens/modescrenn/modescreen.dart';
import 'package:tick_tack_too/screens/offlinemodescreen/offlinemodescreen.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
  
  if (Platform.isWindows) {
    await windowManager.ensureInitialized();
    WindowManager.instance.setMinimumSize(const Size(600, 800));
    WindowManager.instance.setMaximumSize(const Size(600, 800));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
      '/modes':(context)=>modescreen(),
      '/offline':(context)=>Offlinemodescreen(),
      '/online':(context)=>Offlinemodescreen(),
    },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const modescreen(),
    );
  }
}


