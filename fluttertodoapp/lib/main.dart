import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 7, 118, 173),
        brightness: Brightness.dark,
        fontFamily: 'OpenSans',
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 18),
          bodyMedium: TextStyle(fontSize: 14),
        ),
        colorScheme: ColorScheme.dark(
          primary: Color.fromARGB(255, 141, 0, 201),
          secondary: Color.fromARGB(255, 183, 131, 239),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class TodoItem {
  int id;
  String title;
  bool isDone;

  TodoItem({required this.id, required this.title, this.isDone = false});
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _todoItems = <TodoItem>[];
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _todoItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_todoItems[index].title),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: _todoItems[index].isDone,
                        onChanged: (value) {
                          setState(() {
                              int number = index +1;
                              _todoItems[index].isDone = value!;
                              print("task done $number");
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _todoItems.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _titleController,
                    decoration: InputDecoration(labelText: 'Add Todo Item'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_titleController.text.isNotEmpty) {
                      setState(() {
                        _todoItems.add(TodoItem(
                          id: DateTime.now().millisecondsSinceEpoch,
                          title: _titleController.text,
                        ));
                        _titleController.clear();
                      });
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}