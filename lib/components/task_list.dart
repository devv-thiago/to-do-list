import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> taskList;
  final void Function(String) onRemove;

  const TaskList(this.taskList, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (ctx, index) {
        final task = taskList[index];
        return Card(
          child: ListTile(
            title: Text(
              task.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromRGBO(34, 34, 34, 1)),
            ),
            subtitle: Text(
              task.desc,
              style: const TextStyle(
                  color: Color.fromRGBO(133, 130, 131, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            trailing: IconButton(
              onPressed: () => onRemove(task.id),
              icon: const Icon(Icons.delete),
              color: Colors.red[400],
            ),
          ),
        );
      },
    );
  }
}
