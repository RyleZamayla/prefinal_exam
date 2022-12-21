// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

class ViewItem extends StatefulWidget {

  final String Title;
  const ViewItem({Key? key, required this.Title}) : super(key: key);

  @override
  State<ViewItem> createState() => _ViewItemState();
}

class _ViewItemState extends State<ViewItem> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: ListTile(
              title: Center(
                child: Text(widget.Title),
              )
            ),
          ),
        )
    );
  }
}
