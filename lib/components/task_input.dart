import 'package:flutter/material.dart';

class TaskInput extends StatefulWidget {
  final void Function(String, String) onSubmit;

  TaskInput(this.onSubmit);

  @override
  State<TaskInput> createState() => _TaskInputState();
}

class _TaskInputState extends State<TaskInput> {
  final tituloController = TextEditingController();

  final descController = TextEditingController();

  _submitInput() {
    final titulo = tituloController.text;
    final desc = descController.text;
    if (titulo.isEmpty || desc.isEmpty) {
      return;
    } else {
      widget.onSubmit(titulo, desc);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 600,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: tituloController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Titulo',
            ),
          ),
          SizedBox(
            height: 40,
          ),
          TextField(
            maxLines: null,
            maxLength: null,
            controller: descController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Descricao',
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 50,
            width: 200,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromRGBO(126, 126, 242, 1)),
              ),
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
    );
  }
}
