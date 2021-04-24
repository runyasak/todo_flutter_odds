import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/home/home_controller.dart';
import 'package:todo/widgets/title_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Get.put(HomeController());

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
                      action: () => Get.toNamed('/new-todo')!
                          .whenComplete(() => _homeController.setTodo()),
                    ),
                    Obx(
                      () => Container(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: _homeController.todos.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: _homeController.todos[index].complete
                                  ? Icon(
                                      Icons.check_circle_outline_rounded,
                                      color: Colors.green,
                                    )
                                  : Icon(
                                      Icons.panorama_fish_eye,
                                      color: Colors.purple.shade200,
                                    ),
                              title: Text(_homeController.todos[index].topic),
                              subtitle: Text(_homeController.todos[index].msg),
                              trailing: PopupMenuButton(
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 'delete',
                                    child: Text('Delete'),
                                  ),
                                ],
                                onSelected: (value) {
                                  if (value == 'delete') {
                                    _homeController.deleteTodo(index);
                                  }
                                },
                                icon: Icon(Icons.more_vert),
                              ),
                              onTap: () async {
                                await _homeController.completeTodo(index);
                                await _homeController.setTodo();
                              },
                            );
                          },
                        ),
                      ),
                    ),
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
