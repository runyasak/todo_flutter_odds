import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/home/home_controller.dart';
import 'package:todo/screens/new_todo.dart';
import 'package:todo/services/mock_todo.dart';
import 'package:todo/widgets/title_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = Get.put(HomeController());
    _homeController.setTodo();
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
                      actionName: 'new',
                      action: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NewTodoScreen(
                            beforePop: () => _homeController.setTodo(),
                          ),
                        ),
                      ),
                    ),
                    GetBuilder<HomeController>(
                      builder: (controller) => Container(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: controller.todos.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: controller.todos[index].complete
                                  ? Icon(
                                      Icons.check_circle_outline_rounded,
                                      color: Colors.green,
                                    )
                                  : Icon(
                                      Icons.panorama_fish_eye,
                                      color: Colors.purple.shade200,
                                    ),
                              title: Text(controller.todos[index].topic),
                              subtitle: Text(controller.todos[index].msg),
                              trailing: PopupMenuButton(
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 'delete',
                                    child: Text('Delete'),
                                  ),
                                ],
                                onSelected: (value) async {
                                  if (value == 'delete') {
                                    await MockTodo.deleteTodo(index);
                                    await controller.setTodo();
                                  }
                                },
                                icon: Icon(Icons.more_vert),
                              ),
                              onTap: () async {
                                await MockTodo.completeTodo(index);
                                await controller.setTodo();
                              },
                            );
                          },
                        ),
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
