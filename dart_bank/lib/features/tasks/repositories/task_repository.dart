import 'package:dart_bank/features/tasks/models/task_model.dart';

class TaskRepository {
  final List<TaskModel> _tasks = [];

  Future<void> addTask(TaskModel task) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.add(task);
  }

  Future<void> putTask(String id, bool done) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.where((task) => task.getId() == id).first.setDone(done);
  }

  Future<void> removeTask(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.remove(_tasks.where((task) => task.getId() == id).first);
  }

  Future<List<TaskModel>> listTask() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tasks;
  }

  Future<List<TaskModel>> notDoneList() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tasks.where((task) => !task.getDone()).toList();
  }
}
