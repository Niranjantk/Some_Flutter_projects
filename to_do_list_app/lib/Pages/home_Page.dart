import 'package:flutter/material.dart';
import 'package:to_do_list_app/utils/todolist_contents.dart';

class HomePageToDo extends StatefulWidget {
  HomePageToDo({super.key});

  @override
  State<HomePageToDo> createState() => _HomePageToDoState();
}

class _HomePageToDoState extends State<HomePageToDo> {
  final textcontrolder = TextEditingController();
  List todolist = [
    ['learn Flutter', false],
    ['Drink Coffee', false],
  ];

  void onchengeevent(int index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }


  void adddata(){
    setState(() {
      todolist.add([textcontrolder.text,false]);
      textcontrolder.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: Text('To Do List'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (BuildContext context, int index) {
          return TodolistContents(
            title: todolist[index][0],
            checkbox: todolist[index][1],
            onchange: (value) => onchengeevent(index),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: textcontrolder,
                decoration: InputDecoration(
                  hint: Text("Add items"),
                  fillColor: const Color.fromARGB(255, 105, 93, 141),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(onPressed: adddata, child: Icon(Icons.add)),
        ],
      ),
    );
  }
}
