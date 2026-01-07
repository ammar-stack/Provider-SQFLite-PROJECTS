import 'package:flutter/material.dart';
import 'package:notes_app_sqflite_provider/pages/homepage.dart';
import 'package:notes_app_sqflite_provider/providers/notesprovider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
    create: (_) =>Notesprovider()..notesData,
    child: MyApp(),)
  );
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