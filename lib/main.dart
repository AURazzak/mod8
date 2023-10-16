import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class TodoItem {
  String title;
  String description;

  TodoItem(this.title, this.description);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  List<TodoItem> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 40,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Add title',
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Add description',
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        final title = titleController.text;
                        final description = descriptionController.text;
                        if (title.isNotEmpty) {
                          todos.add(TodoItem(title, description));
                          titleController.clear();
                          descriptionController.clear();
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text('Add'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 60,
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final item = todos[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                  title: Text(item.title),
                  trailing: Icon(Icons.arrow_forward),
                  subtitle: Text(item.description),
                  onLongPress: () {
                    _showEditDeleteDialog(context, item, index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showEditDeleteDialog(BuildContext context, TodoItem item, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit or Delete'),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _showEditBottomModalSheet(context, item, index);
                  },
                  child: Text('Edit'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      todos.removeAt(index);
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _showEditBottomModalSheet(
      BuildContext context, TodoItem item, int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Edit title',
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Edit description',
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      todos[index].title = titleController.text;
                      todos[index].description = descriptionController.text;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Edit done'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
