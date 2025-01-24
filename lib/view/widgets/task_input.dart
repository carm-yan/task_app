import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskInput extends StatelessWidget {
  final Function(String) onAddTask;

  const TaskInput({super.key, required this.onAddTask});

  @override
  Widget build(BuildContext context) {
    final TextEditingController taskController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 242, 245),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: taskController,
              decoration: const InputDecoration(
                hintText: 'Agrega una tarea',
                //border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            style: TextButton.styleFrom(
              maximumSize: const Size(80, 50),
            ),
            icon: const Icon(CupertinoIcons.add_circled_solid),
            color: Colors.green,
            onPressed: () {
              if (taskController.text.isNotEmpty) {
                //validamos que la tarea no esté vacía
                onAddTask(taskController.text);
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Error'),
                      content: const Text('No puedes agregar una tarea vacía'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Ok'),
                        ),
                      ],
                    );
                  },
                );
              }

              taskController.clear();
            },
          ),
        ],
      ),
    );
  }
}
