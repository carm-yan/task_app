import 'package:app_tareas/view/widgets/task_input.dart';
import 'package:app_tareas/view/widgets/task_list.dart';
import 'package:flutter/material.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  _TodoHomePageState createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  final List<String> _tasks = [];
//se agrega una tarea a la lista de tareas
  void _addTask(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _tasks.add(task);
      });
    }
  }

//se edita una tarea de la lista de tareas
  void _editTask(int index, String newTask) {
    if (newTask.isNotEmpty) {
      setState(() {
        _tasks[index] = newTask;
      });
    }
  }

//se elimina una tarea de la lista de tareas
  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _showEditDialog(int index) {
    final TextEditingController editController =
        TextEditingController(text: _tasks[index]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Tarea'),
          content: TextField(
            controller: editController,
            decoration: const InputDecoration(hintText: 'Actualizar tarea'),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(decorationColor: Colors.white),
                backgroundColor: const Color.fromARGB(255, 131, 215, 230),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 131, 215, 230),
                textStyle: const TextStyle(decorationColor: Colors.white),
              ),
              onPressed: () {
                _editTask(index, editController.text);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tareas App'),
      ),
      backgroundColor: const Color.fromARGB(255, 149, 169, 207),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TaskInput(onAddTask: _addTask),
            const SizedBox(
                height: 16), //da un separación entre el input y las tareas
            Expanded(
              child: TaskList(
                tasks: _tasks,
                onEditTask: _showEditDialog,
                onDeleteTask: _deleteTask,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
