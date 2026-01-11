import 'package:flutter/material.dart';
import 'package:tasks_app/model/task.dart';

class DetailScreen extends StatefulWidget {
  final Task task;
   const DetailScreen( this.task, {super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }
  _appBar(){
    return AppBar(
      title: const Text('Detalhes',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.black,
      centerTitle: true,
    );
  }

  _body(){
    return  Center(
      child: Text(widget.task.title!),
    );
  }
}
