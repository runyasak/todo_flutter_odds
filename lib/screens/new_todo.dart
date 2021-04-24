import 'package:flutter/material.dart';

class NewTodoScreen extends StatefulWidget {
  @override
  _NewTodoScreenState createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends State<NewTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/cover.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.7,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  children: [],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top,
              child: Container(
                padding: EdgeInsets.only(
                  left: 16,
                  top: 8,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
