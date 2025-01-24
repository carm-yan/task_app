import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final List<String> tasks;
  final Function(int) onEditTask;
  final Function(int) onDeleteTask;

  const TaskList({
    super.key,
    required this.tasks,
    required this.onEditTask,
    required this.onDeleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            title: Text(tasks[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(CupertinoIcons.pencil),
                  color: Colors.blue,
                  onPressed: () => onEditTask(index),
                ),
                IconButton(
                  icon: const Icon(CupertinoIcons.delete),
                  color: Colors.red,
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Eliminar Tarea'),
                        content:
                            const Text('¿Estás seguro de eliminar la tarea?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () {
                              onDeleteTask(index);
                              Navigator.of(context).pop();
                            },
                            child: const Text('Eliminar'),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
