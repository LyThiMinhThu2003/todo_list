import 'package:flutter/material.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  //List<String> tasks = [];
  final tasks = <String>[];
  TextEditingController taskController = TextEditingController();

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List App'),
      ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child:TextField(
              controller: taskController,
              decoration: InputDecoration(
                labelText: 'Nhập tên công việc',
              ),
              ),
            ),
            ElevatedButton(
              onPressed: addTask, 
              child: Text('Thêm công việc'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks.elementAt(index)),
                    trailing: IconButton(
                      onPressed: () {
                        tasks.removeAt(index);
                        setState(() {
                          //TODO: Kiểm tra điều kiện trước khi thêm task                    
                        });
                      }, 
                      icon: Icon(Icons.delete)),
                  );
            },
          ),
        ),
      ],
    ),
  );
  }

  void addTask() {
    setState(() {
      tasks.add(taskController.text);
      debugPrint(tasks.toString());
      taskController.clear();
    });
  }
}