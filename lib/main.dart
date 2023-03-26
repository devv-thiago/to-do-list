import 'package:flutter/material.dart';
import 'models/task.dart';
import 'components/task_list.dart';
import 'components/task_input.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  final _tasks = [
    Task(
        title: 'Trabalho faculdade',
        desc: 'Realizar o trabalho de Sistemas da Informacao'),
    Task(
      title: 'Estudar',
      desc: 'Estudar para provas',
    )
  ];

  _addTask(String titulo, String descricao) {
    final newTask = Task(
      title: titulo,
      desc: descricao,
    );

    setState(() {
      _tasks.add(newTask);
    });

    Navigator.of(context).pop();
  }

  _openTaskInputModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TaskInput(_addTask);
        });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0))),
            backgroundColor: Color.fromRGBO(126, 126, 242, 1),
            title: const Text("Minhas Tarefas"),
            actions: [
              IconButton(
                onPressed: () => _openTaskInputModal(context),
                icon: Icon(Icons.add),
              )
            ],
          ),
          body: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(34, 34, 34, 1)),
            child: ListView(
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        TaskList(_tasks),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _openTaskInputModal(context),
            child: Icon(Icons.add),
            backgroundColor: Colors.red[400],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat),
    );
  }
}
