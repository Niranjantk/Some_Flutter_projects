import 'package:flutter/material.dart';

class ProfilePageDemo2 extends StatelessWidget {
  const ProfilePageDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.search_off_rounded),
      backgroundColor: Colors.grey,elevation: 40,),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hello world"),
        backgroundColor: Colors.blue,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.online_prediction_sharp)),
        actions: [
          Icon(Icons.menu),
          Icon(Icons.search)
        ],
      ),
    );
  }
}