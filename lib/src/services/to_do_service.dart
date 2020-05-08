import 'dart:convert';

import 'package:to_do/src/model/to_do.dart';
import 'package:http/http.dart' as http;

class TodoService {

  Future<List<ToDo>> getAll() async {
    final String url = "https://jsonplaceholder.typicode.com/todos";

    final http.Response resp = await http.get(
      url
    );

    final List<dynamic> respDecoded = json.decode(resp.body);

    return respDecoded.map((t) => ToDo.fromJson(t)).toList();
  }
  
}
