import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tick_tack_too/firebase_options.dart';
import 'package:tick_tack_too/screens/modescrenn/modescreen.dart';
import 'package:tick_tack_too/screens/offlinemodescreen/offlinemodescreen.dart';
import 'package:tick_tack_too/screens/onlinemode/active_users_page/activeusers.dart';
import 'package:tick_tack_too/screens/onlinemode/gamescreen/screen.dart';
import 'package:tick_tack_too/screens/onlinemode/loginpage/login.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
  
  if (Platform.isWindows) {
    await windowManager.ensureInitialized();
    WindowManager.instance.setMinimumSize(const Size(600, 800));
    WindowManager.instance.setMaximumSize(const Size(600, 800));
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget with WidgetsBindingObserver{
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    

  }
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
      '/modes':(context)=>const modescreen(),
      '/offline':(context)=>const Offlinemodescreen(),
      '/online':(context)=>const Offlinemodescreen(),
      '/login':(context)=>const loginpage(),
      '/activeusers':(context)=>const Activeusers(),
      '/onlineoyun':(context)=>const screen()
    
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


