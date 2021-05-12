import 'package:flutter/material.dart';

class TodoWidget extends StatefulWidget {
  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  List todoList = [];
  final pushTodoController = TextEditingController();

  void dispose() {
    pushTodoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Checkbox(
                      activeColor: Colors.transparent,
                      value: todoList[index]['isDone'],
                      onChanged: (bool value) {
                        setState(() {
                          todoList[index]['isDone'] =
                              !todoList[index]['isDone'];
                        });
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                    todoList[index]['todo'],
                    style: todoList[index]['isDone']
                        ? TextStyle(
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 1.5,
                            decorationStyle: TextDecorationStyle.double)
                        : null,
                  )),
                  IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          todoList.removeAt(index);
                        });
                      })
                ],
              );
            }),
        Row(
          children: [
            Flexible(
              child: TextField(
                controller: pushTodoController,
                decoration:
                    InputDecoration(hintText: 'What do you want to do today?'),
                onSubmitted: (String str) {
                  setState(() {
                    todoList.add({"todo": str, "isDone": false});
                    pushTodoController.clear();
                  });
                },
              ),
            ),
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    todoList.add(
                        {"todo": pushTodoController.text, "isDone": false});
                    pushTodoController.clear();
                  });
                }),
          ],
        ),
      ],
    );
  }
}
