import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_sqflite_provider/Pages/homepage.dart';
import 'package:todo_app_sqflite_provider/providers/todoprovider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Todoprovider()..getToDos(),
      child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}
