import 'package:flutter/material.dart';

class TaskInput extends StatelessWidget {
  final tituloController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            child: TextField(
              controller: tituloController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Titulo',
              ),
            ),
          ),
          Container(
            child: TextField(
              controller: descController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Descricao',
              ),
            ),
          ),
          Container(
            height: 50,
            width: 120,
            color: Colors.blue[600],
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Adicionar tarefa",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
