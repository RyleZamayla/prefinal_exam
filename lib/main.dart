// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:prefinal_exam/item_viewer.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}


class _TodoListState extends State<TodoList> {
  List todos = <dynamic> [];

  @override
  void initState() {
    super.initState();
    getTodo();
  }

  getTodo() async {
    var url = 'https://jsonplaceholder.typicode.com/todos';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200){
      setState(() {
        todos = convert.jsonDecode(response.body);
      });
    }
    else {
      throw Exception ('Failed to load data');
    }
  }

  Future getItemTodo(int myOwnId) async {
    var itemUrl = 'https://jsonplaceholder.typicode.com/todos';
    var item = await http.get(Uri.parse('$itemUrl/$myOwnId'));
    Map map = convert.jsonDecode(item.body);
    // ignore: non_constant_identifier_names
    String Title = map['title'];
    return Title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Initial start")
      ),
      body: ListView.builder(
        itemCount: todos.length,
          itemBuilder: (BuildContext context, int index){
          return GestureDetector(
          onLongPress: () async {

            String holder = await getItemTodo(todos[index]['id']);
            await Navigator.push(
              context,
                MaterialPageRoute(
                  builder: (context) => ViewItem(Title: holder)),
                );
                setState(() {

                });
              },
            child: ListTile(
              title: Text(todos[index]['title'].toString()),
            )
          );
        }
      )
    );
  }
}
