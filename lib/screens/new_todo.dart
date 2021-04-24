import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/services/mock_todo.dart';
import 'package:todo/widgets/title_bar.dart';

class NewTodoScreen extends StatefulWidget {
  @override
  _NewTodoScreenState createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends State<NewTodoScreen> {
  TextEditingController topicController = TextEditingController();
  TextEditingController todoController = TextEditingController();
  FocusNode topicFocusNode = FocusNode();
  FocusNode todoFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: Get.height,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/cover.png',
                width: Get.width,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: Get.height / 1.7,
                  width: Get.width,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Column(
                    children: [
                      TitleBar(
                        actionName: 'save',
                        action: () async {
                          if (topicController.text.isEmpty ||
                              todoController.text.isEmpty) {
                            return;
                          }

                          await MockTodo.addTodo(
                            Todo(
                              topic: topicController.text,
                              msg: todoController.text,
                              complete: false,
                            ),
                          );

                          Get.back();
                        },
                      ),
                      TextField(
                        controller: topicController,
                        focusNode: topicFocusNode,
                        cursorColor: Colors.grey.shade600,
                        decoration: InputDecoration(
                          labelText: 'Topic',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.grey.shade600,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: TextField(
                          controller: todoController,
                          focusNode: todoFocusNode,
                          cursorColor: Colors.grey.shade600,
                          maxLines: 8,
                          decoration: InputDecoration(
                            labelText: 'Todo...',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Colors.grey.shade600,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: Get.mediaQuery.padding.top,
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
      ),
    );
  }
}
