import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/home/home_controller.dart';
import 'package:todo/widgets/title_bar.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      actionName: 'new',
                      action: () => Get.toNamed('/new-todo')!
                          .whenComplete(() => controller.setTodo()),
                    ),
                    Obx(
                      () => Container(
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
                                onSelected: (value) {
                                  if (value == 'delete') {
                                    controller.deleteTodo(index);
                                  }
                                },
                                icon: Icon(Icons.more_vert),
                              ),
                              onTap: () async {
                                await controller.completeTodo(index);
                                await controller.setTodo();
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
