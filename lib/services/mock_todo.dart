import 'package:todo/models/todo_model.dart';

class MockTodo {
  static List<Todo> todos = [
    Todo(
      topic: 'อ่านหนังสือหลังตื่นนอน',
      msg: 'อ่านเล่ม ทำยังไงให้สาธิดีขึ้น',
      complete: false,
    ),
    Todo(
      topic: 'อ่านหนังสือก่อนนอน',
      msg: 'อ่านเล่ม นอนอย่างมีประสิทธิภาพ',
      complete: false,
    ),
  ];

  static Future<List<Todo>> getTodo() async {
    await Future.delayed(Duration(milliseconds: 200));
    return todos;
  }

  static Future<void> completeTodo(int index) async {
    await Future.delayed(Duration(milliseconds: 200));
    todos[index].complete = !todos[index].complete;
  }

  static Future<void> deleteTodo(int index) async {
    await Future.delayed(Duration(milliseconds: 200));
    todos.removeAt(index);
  }

  static Future<void> addTodo(Todo todo) async {
    await Future.delayed(Duration(milliseconds: 200));
    todos.add(todo);
  }
}
