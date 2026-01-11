import 'package:flutter/material.dart';
import 'package:tasks_app/model/task.dart';
import 'package:tasks_app/screen/detail_screen.dart';
import 'package:tasks_app/util/nav.dart';

import '../service/task_service.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final TaskService _service = TaskService();

  List<Task> tasks = [];
  bool __loading = true;
  String? _error;


  @override
  void initState() {
    super.initState();

    _loadTasks();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar(){
    return AppBar(
      title: const Text('Tarefas',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.black,
      centerTitle: true,
    );
  }

  _body(){

    if (__loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if(_error != null ){
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_error!, style: const TextStyle(color: Colors.red,),),
            ElevatedButton.icon(onPressed: _loadTasks,
              icon: const Icon(Icons.refresh) ,
              label:Text("Tentar Novamente",),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ) ,
            ),
          ],
        ),
      );
    }

    if(tasks.isEmpty){
      return Center(child: Text("Nenhum registro encontrado"));
    }
    return RefreshIndicator(
      onRefresh: _loadTasks,
      child: ListView.separated(
          itemCount: tasks.length,
          separatorBuilder: (_, _) => const Divider(height:1),
          itemBuilder: (_, index){
            final item = tasks[index];

            //String finalTitle = formatTitle(item);

            return ListTile(
              leading:  Icon(Icons.check_box_outlined),
              title: Text(item.title!),
              subtitle: Text(item.descriprion!),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                push(context, DetailScreen(item));
              },
            );
          }
      ),
    );
  }

  Future<void> _loadTasks() async{
    setState(() {
      __loading = true;
      _error = null;
    });
    try{
      final tasksList = await _service.findAll();
      setState(() {
        tasks = tasksList;
      });
    } catch(e){
      setState(() {
        _error = "Erro ao carregar";
        tasks = [];
      });
    } finally {
      setState(() {
        __loading = false;
      });
    }

  }

 // String formatTitle(Task item) {
 //   return "${item.status!} - ${item.title!}" ;
 // }
}