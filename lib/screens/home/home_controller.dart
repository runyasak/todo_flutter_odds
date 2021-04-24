import 'package:get/get.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/services/mock_todo.dart';

class HomeController extends GetxController {
  RxList<Todo> _todos = RxList<Todo>([]);

  List<Todo> get todos => _todos;
  set todos(value) => _todos.value = [...value];

  @override
  onInit() {
    super.onInit();
    setTodo();
  }

  Future<void> setTodo() async {
    final result = await MockTodo.getTodo();
    todos = result;
  }

  Future<void> deleteTodo(int index) async {
    await MockTodo.deleteTodo(index);
    await setTodo();
  }

  Future<void> completeTodo(int index) async {
    await MockTodo.completeTodo(index);
    await setTodo();
  }
}
