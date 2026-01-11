import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/task.dart';
import '../util/api_url.dart';

class TaskService {
  final String apiPath = "${ApiUrl.BASE_URL}tasks";

  Future<List<Task>> findAll() async{
    final reponse =
        await http.get(Uri.parse(apiPath)).timeout(const Duration(seconds: 5));

    if(reponse.statusCode == 200){

      final List<dynamic> jsonList = jsonDecode(reponse.body);
      return jsonList.map((e) => Task.fromJson(e)).toList();

    } else{
      print("Houve um erro  na requisicao");
      throw Exception("Houve um erro na requisicao");
    }
  }
}
