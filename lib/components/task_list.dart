import 'package:flutter/material.dart';
import '../models/task.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskList extends StatefulWidget {
  final List<Task> taskList;

  const TaskList(this.taskList, {super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: widget.taskList.length,
        itemBuilder: (ctx, index) {
          //
          final task = widget.taskList[index];
          //
          return Card(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromRGBO(34, 34, 34, 1)),
                  ),
                  Text(
                    task.desc,
                    style: TextStyle(
                        color: Color.fromRGBO(133, 130, 131, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
