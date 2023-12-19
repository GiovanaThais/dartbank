import 'package:dart_bank/features/tasks/models/task_model.dart';
import 'package:dart_bank/features/tasks/repositories/task_repository.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final descriptionController = TextEditingController();
  var _tasks = const <TaskModel>[];
  final taskRepository = TaskRepository();
  var onlyNotDone = false;

  @override
  void initState() {
    super.initState();
    gettingTasks();
  }

  void gettingTasks() async {
    if (onlyNotDone) {
      //filtrando apenas os não concluidos
      _tasks = await taskRepository.notDoneList();
    } else {
      _tasks = await taskRepository.listTask();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            descriptionController.text = "";
            buttonTaskMethod(context);
          },
        ),
        body: bodyPageMethod());
  }

  Container bodyPageMethod() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Apenas não concluídos",
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                    value: onlyNotDone,
                    onChanged: (bool value) {
                      onlyNotDone = value;
                      gettingTasks();
                    })
              ],
            ),
          ),
          listTaskDoneMethod(),
        ],
      ),
    );
  }

  Future<dynamic> buttonTaskMethod(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext bc) {
          return AlertDialog(
            title: const Text("Add task"),
            content: TextField(
              controller: descriptionController,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancelar")),
              TextButton(
                  onPressed: () async {
                    await taskRepository
                        .addTask(TaskModel(descriptionController.text, false));
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: const Text("Salvar"))
            ],
          );
        });
  }

  Expanded listTaskDoneMethod() {
    return Expanded(
      child: ListView.builder(
          itemCount: _tasks.length,
          itemBuilder: (BuildContext bc, int index) {
            var task = _tasks[index];
            return Dismissible(
              onDismissed: (DismissDirection dismissDirection) async {
                await taskRepository.removeTask(task.id);
                gettingTasks();
              },
              key: Key(task.id),
              child: ListTile(
                title: Text(task.description),
                trailing: Switch(
                  onChanged: (bool value) async {
                    await taskRepository.putTask(task.id, value);
                    gettingTasks();
                  },
                  value: task.done,
                ),
              ),
            );
          }),
    );
  }
}
