import 'package:flutter/material.dart';
import './models/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _tasks = [
    Task(
        title: 'Trabalho faculdade',
        desc: 'Realizar o trabalho de Sistemas da Informacao'),
    Task(
      title: 'Estudar',
      desc: 'Estudar para provas',
    ),
    Task(
      title: 'Estudar 2',
      desc: 'Estudar Dart',
    )
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.amber,
          ),
          child: Column(
            children: [
              ..._tasks.map((t) {
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
            ],
          ),
        ),
      ),
    );
  }
}
