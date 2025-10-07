import 'package:flutter/material.dart';
import 'package:flutter_app/views/pages/settings_page.dart';
import 'package:flutter_app/views/widgets/navbar_widget.dart';
import 'package:flutter_app/views/widgets/theme_changer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class TodoItem {
  final String id;
  final String title;
  bool isCompleted;

  TodoItem({required this.id, required this.title, this.isCompleted = false});
}

class _HomePageState extends State<HomePage> {
  List<TodoItem> _todos = [
    TodoItem(id: '1', title: 'Learn Flutter'),
    TodoItem(id: '2', title: 'Build a todo app'),
    TodoItem(id: '3', title: 'Add tap to complete'),
    TodoItem(id: '4', title: 'Style the UI'),
    TodoItem(id: '5', title: 'Test the app'),
  ];

  void _toggleTodo(String id) {
    setState(() {
      final todoIndex = _todos.indexWhere((todo) => todo.id == id);
      if (todoIndex != -1) {
        _todos[todoIndex].isCompleted = !_todos[todoIndex].isCompleted;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, textAlign: TextAlign.center),
        // leading: Padding(
        //   padding: const EdgeInsets.all(12.0),
        //   child: Image.asset(
        //     'assets/images/logo_big_char.png',
        //     width: 24,
        //     height: 24,
        //     fit: BoxFit.cover,
        //   ),
        // ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print('Add Todo');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Header'),
                ),
                ListTile(
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Profile'),
                  onTap: () {
                    // Handle item 2 tap
                  },
                ),
              ],
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: ThemeChangerWidget(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Add Todo');
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg-cover.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withValues(alpha: 0.5),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Todo List',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: _todos.length,
                    itemBuilder: (context, index) {
                      final todo = _todos[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        color: Colors.white.withValues(alpha: 0.9),
                        child: ListTile(
                          leading: Icon(
                            todo.isCompleted
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: todo.isCompleted
                                ? Colors.green
                                : Colors.grey,
                          ),
                          title: Text(
                            todo.title,
                            style: TextStyle(
                              decoration: todo.isCompleted
                                  ? TextDecoration.lineThrough
                                  : null,
                              color: todo.isCompleted
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                          ),
                          onTap: () => _toggleTodo(todo.id),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
