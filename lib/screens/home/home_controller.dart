import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/services/mock_todo.dart';

class HomeController extends GetxController {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;
  set todos(value) => _todos = value;

  Future<void> setTodo() async {
    _todos = await MockTodo.getTodo();
    update();
  }
}
