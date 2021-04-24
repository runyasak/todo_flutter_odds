class Todo {
  late String topic;
  late String msg;
  late bool complete;

  Todo({
    required this.topic,
    required this.msg,
    required this.complete,
  });

  Todo.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    msg = json['msg'];
    complete = json['complete'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['topic'] = topic;
    _data['msg'] = msg;
    _data['complete'] = complete;
    return _data;
  }
}
