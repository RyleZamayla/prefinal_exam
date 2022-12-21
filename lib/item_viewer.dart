import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ViewItem extends StatefulWidget {

  final int myOwnId;
  final Function getItem;
  const ViewItem({Key? key, required this.myOwnId, required this.getItem}) : super(key: key);

  @override
  State<ViewItem> createState() => _ViewItemState();
}

class _ViewItemState extends State<ViewItem> {

  late dynamic todosPlaceholder = {};


  @override
  void initState() {
    getItemTodo(widget.myOwnId);
    super.initState();
  }

  Future getItemTodo(myOwnId) async {
    var itemUrl = 'https://jsonplaceholder.typicode.com/todos';
    var item = await http.get(Uri.parse('$itemUrl/$myOwnId'));
    setState(() {
      todosPlaceholder = convert.jsonDecode(item.body);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: ListTile(
              title: Center(
                child: Text(todosPlaceholder['title']),
              )
            ),
          ),
        )
    );
  }
}
