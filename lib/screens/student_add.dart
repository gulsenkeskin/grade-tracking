import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Yeni öğrenci ekle"),
     ),
      body:Center(
        child: Text("Öğrenci"),
      ),
   );
  }

}