import 'package:flutter/material.dart';

class TodolistContents extends StatelessWidget {
  const TodolistContents({
    super.key,
    required this.title,
    required this.checkbox,
    this.onchange,
  });
  final String title;
  final bool checkbox;
  final Function(bool?)? onchange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10, right: 20, left: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepPurple,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Checkbox(
                checkColor: Colors.black,
                activeColor: Colors.white,
                side: BorderSide(color: Colors.white),
                value: checkbox,
                onChanged: onchange,
              ),
              Text(
                title,
                style: TextStyle(
                  decoration: checkbox
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: Colors.white,
                  decorationColor: Colors.white,
                  decorationThickness: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
