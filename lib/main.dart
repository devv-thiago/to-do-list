import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/task.dart';
import 'components/task_list.dart';
import 'components/task_input.dart';
import 'dart:math';
import 'services/db.dart';

void main() async {
  runApp(const MyApp());
}

class AppData {
  static final db = DatabaseManager();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    return const MaterialApp(
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
  late List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final db = AppData.db;
    List<Map<String, dynamic>> tasks = await db.getRegisters();
    List<Task> loadedTasks = [];
    for (var i in tasks) {
      Task task = Task(id: i['id'].toString(), title: i['title'], desc: i['description']);
      loadedTasks.add(task);
    }
    setState(() {
      _tasks = loadedTasks;
    });
  }

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
    final db = AppData.db;
    db.addRegister(titulo, descricao);
  }

  _deleteTask(String id) {
    setState(() {
      _tasks.removeWhere((tr) => id == tr.id);
      final db = AppData.db;
      db.deleteRegister(id);
    });
  }

  _openTaskInputModal(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(child: TaskInput(_addTask));
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
      backgroundColor: const Color.fromRGBO(126, 126, 242, 1),
      title: const Text("Minhas Tarefas"),
      actions: [
        IconButton(
          onPressed: () => _openTaskInputModal(context),
          icon: const Icon(Icons.add),
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
            decoration:
                const BoxDecoration(color: Color.fromRGBO(34, 34, 34, 1)),
            child: ListView(
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
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
            backgroundColor: Colors.red[400],
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat),
    );
  }
}
