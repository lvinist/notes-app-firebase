import 'package:flutter/material.dart';

class TodoWidget extends StatefulWidget {
  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  List todoList = [];

  final pushTodoController = TextEditingController();
  void addTodo() {
    setState(() {
      if (pushTodoController.text.isNotEmpty) {
        todoList.add({"todo": pushTodoController.text, "isDone": false});
        pushTodoController.clear();
      } else if (pushTodoController.text.isEmpty) {
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Please add todo first'),
          duration: Duration(seconds: 3),
        ));
      }
    });
  }

  void dispose() {
    pushTodoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: TextField(
                controller: pushTodoController,
                decoration:
                    InputDecoration(hintText: 'What do you want to do today?'),
                onSubmitted: (String str) {
                  setState(() {
                    addTodo();
                  });
                },
              ),
            ),
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    addTodo();
                  });
                }),
          ],
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
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
                      child: TextField(
                    decoration:
                        InputDecoration(enabledBorder: InputBorder.none),
                    controller: TextEditingController()
                      ..text = todoList[index]['todo'],
                    style: todoList[index]['isDone']
                        ? TextStyle(
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 1.5,
                            decorationStyle: TextDecorationStyle.double)
                        : null,
                    onSubmitted: (String str) {
                      setState(() {
                        todoList[index]['todo'] = str;
                      });
                    },
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
      ],
    );
  }
}
