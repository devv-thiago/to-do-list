import 'package:flutter/material.dart';
import 'models/task.dart';
import 'components/task_list.dart';
import 'components/task_input.dart';
import 'dart:math';

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
  final List<Task> _tasks = [];

  _addTask(String titulo, String descricao) {
    final newTask = Task(
      id: Random().nextDouble().toString(),
      title: titulo,
      desc: descricao,
    );

    setState(() {
      _tasks.add(newTask);
    });

    Navigator.of(context).pop();
  }

  _deleteTask(String id) {
    setState(() {
      _tasks.removeWhere((tr) => id == tr.id);
    });
  }

  _openTaskInputModal(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(content: TaskInput(_addTask));
        });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
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
    );

    final alturaTela = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return MaterialApp(
      home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: appBar,
          body: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(34, 34, 34, 1)),
            child: ListView(
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: alturaTela,
                          child: TaskList(_tasks, _deleteTask),
                        ),
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
