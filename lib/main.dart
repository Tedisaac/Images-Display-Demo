
import 'package:flutter/material.dart';
import 'package:mvvm_architecture_demo/view/home.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'MVVM Demo',
      theme: ThemeData(
      primarySwatch: Colors.cyan,
      ),
      home: const HomePage(),
    );
  }
}