import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  int contador = 0;

  ControllerBase() {
    autorun((_) {
      print(contador);
    });
  }
  @action
  incrementar() {
    contador++;
  }
}
