import 'package:flutter/material.dart';

class TaskInput extends StatelessWidget {
  final tituloController = TextEditingController();
  final descController = TextEditingController();

  final void Function(String, String) onSubmit;

  TaskInput(this.onSubmit);

  _submitInput() {
    final titulo = tituloController.text;
    final desc = descController.text;
    if (titulo.isEmpty || desc.isEmpty) {
      return;
    } else {
      onSubmit(titulo, desc);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Card(
        child: Column(
          children: [
            TextField(
              controller: tituloController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Titulo',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Descricao',
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: _submitInput,
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
      ),
    );
  }
}
