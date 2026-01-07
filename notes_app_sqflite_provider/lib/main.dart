import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_sqflite_provider/pages/homepage.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}