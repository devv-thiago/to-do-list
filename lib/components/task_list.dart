import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskList extends StatelessWidget {


  late final List<Task> taskList;

  TaskList(this.taskList){

  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...taskList.map((t) {
        return Card(
          child: Container(
            height: 100,
            width: 300,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: const Color.fromRGBO(255, 255, 255, 1),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Column(
              children: [
                Text(
                  t.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(t.desc),
              ],
            ),
          ),
        );
      })
    ]);
  }
}
