import 'package:mobx/mobx.dart';
import 'package:mobxapp2/models/client.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class  _ControllerBase with Store{
      
    var client = Client();

    @computed
    bool get isValid{
      return validateName() == null && validateEmail() == null && validateCpf == null;
    }

    String validateName(){
      if (client.name==null || client.name.isEmpty){
        return "Este Campo é Obrigatório";
      }else if(client.name.length < 3 ) {
        return "Precisa ter mais que 3 caracteres";
      }

      return null;
    }

    String validateEmail(){
      if (client.email==null || client.email.isEmpty){
        return "Este Campo é Obrigatório";
      }else if (!client.email.contains("@")){
        return "Este não é um email válido";
      }

      return null;
    }

    String validateCpf(){
      if (client.cpf==null || client.cpf.isEmpty){
        return "Este Campo é Obrigatório";
      }

      return null;
    }

   dispose(){}

}