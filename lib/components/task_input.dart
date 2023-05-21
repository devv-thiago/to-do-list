import 'package:flutter/material.dart';

class TaskInput extends StatefulWidget {
  final void Function(String, String) onSubmit;

  const TaskInput(this.onSubmit, {super.key});

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
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom
          ),
          child: Column(
            children: [
              TextField(
                controller: tituloController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Titulo',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                maxLines: null,
                maxLength: null,
                controller: descController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Descricao',
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  style: const ButtonStyle(
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
        ),
      ),
    );
  }
}
