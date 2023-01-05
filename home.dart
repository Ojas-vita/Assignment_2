// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_3/util/dialog_box.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../util/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _taskController = TextEditingController();

  List ToDoList = [
    ["Flutter", false],
    ["Workout", false],
    ["Youtube Research", false],
    ["Guitar Breaks", false],
    ["Anime Backlog", false],
    ["Work on Drafts", false],
    ["Report", false],
    ["Coding", false],
  ];

  void saveNewTask() {
    setState(
      () {
        ToDoList.add([_taskController.text, false]);
        _taskController.clear();
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      ToDoList.removeAt(index);
    });
  }

  void deleteAllTask() {
    setState(() {
      ToDoList.length = 0;
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          Controller: _taskController,
          onSave: saveNewTask,
        );
      },
    );
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      ToDoList[index][1] = !ToDoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          "To-Do List",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 1,
        shadowColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: ToDoList.length,
        itemBuilder: (context, index) {
          return ToDo(
            taskName: ToDoList[index][0],
            taskCompleted: ToDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
            deleteAll: (context) => deleteAllTask(),
          );
        },
      ),
      bottomNavigationBar:
          GNav(rippleColor: Colors.grey, hoverColor: Colors.orange, tabs: [
        GButton(
          icon: Icons.edit,
          text: 'Add Task',
          onPressed: createNewTask,
        ),
        GButton(
          icon: Icons.delete_rounded,
          text: 'Clear All',
          onPressed: deleteAllTask,
        ),
      ]),
    );
  }
}
