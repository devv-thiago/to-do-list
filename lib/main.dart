import 'package:flutter/material.dart';
import 'components/task_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0; // 1. Variável para armazenar o índice da página atual

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Minhas Tarefas")),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            children: [
              Container(
                child: Column(
                  children: [
                    TaskUser(),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: BottomAppBar(),
      ),
    );
  }
}
