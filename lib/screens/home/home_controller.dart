import 'package:get/get.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/services/mock_todo.dart';

class HomeController extends GetxController {
  RxList<Todo> _todos = RxList<Todo>([]);

  List<Todo> get todos => _todos;
  set todos(value) => _todos.value = value;

  Future<void> setTodo() async {
    final result = await MockTodo.getTodo();
    todos = result;
  }
}
