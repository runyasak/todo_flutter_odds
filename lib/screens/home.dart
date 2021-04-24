import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/screens/new_todo.dart';
import 'package:todo/services/mock_todo.dart';
import 'package:todo/widgets/title_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todos = [];

  setTodo() async {
    final _todos = await MockTodo.getTodo();
    setState(() {
      todos = _todos;
    });
  }

  @override
  void initState() {
    super.initState();
    this.setTodo();
  }

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
                  children: [
                    TitleBar(
                      actionName: 'save',
                      action: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NewTodoScreen(),
                        ),
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: todos.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: todos[index].complete
                                ? Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.panorama_fish_eye,
                                    color: Colors.purple.shade200,
                                  ),
                            title: Text(todos[index].topic),
                            subtitle: Text(todos[index].msg),
                            trailing: IconButton(
                              icon: Icon(Icons.more_vert),
                              onPressed: () {},
                            ),
                            onTap: () async {
                              await MockTodo.completeTodo(index);
                              await this.setTodo();
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
