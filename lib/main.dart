import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/screens/home/home.dart';
import 'package:todo/screens/new_todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.kanit().fontFamily,
      ),
      home: HomeScreen(),
      getPages: [
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/new-todo', page: () => NewTodoScreen())
      ],
    );
  }
}
