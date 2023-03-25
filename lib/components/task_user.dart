import 'package:flutter/material.dart';
import '../models/task.dart';
import '../components/task_input.dart';
import '../components/task_list.dart';

class TaskUser extends StatefulWidget {
  @override
  State<TaskUser> createState() => _TaskUserState();
}
//

class _TaskUserState extends State<TaskUser> {
  final _tasks = [
    Task(
        title: 'Trabalho faculdade',
        desc: 'Realizar o trabalho de Sistemas da Informacao'),
    Task(
      title: 'Estudar',
      desc: 'Estudar para provas',
    )
  ];

  void _addTask(String titulo, String descricao) {
    final newTask = Task(
      title: titulo,
      desc: descricao,
    );

    setState(() {
      _tasks.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TaskList(_tasks),
        TaskInput(_addTask),
      ],
    );
  }
}
