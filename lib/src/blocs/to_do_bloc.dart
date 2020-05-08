import 'package:rxdart/rxdart.dart';
import 'package:to_do/src/model/to_do.dart';
import 'package:to_do/src/services/to_do_service.dart';

class ToDoBloc {

  //se instancia el servicio
  final TodoService _todoService = new TodoService();

  // inicia el flujo de datos
  final BehaviorSubject<List<ToDo>> _todoController = BehaviorSubject<List<ToDo>>();

  //Expone el flujo principal a los oyentes
  Stream<List<ToDo>> get todoStream => _todoController.stream;

  //expone el ultimo valor emitido por el flujo de datos
  List<ToDo> get todos => _todoController.value;

  void getAll() async{
    _todoController.add(await _todoService.getAll());
  }

  //Cierra el flujo de datos
  dispose(){
    _todoController.close();
  }
}