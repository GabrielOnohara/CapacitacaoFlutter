import 'package:mobx/mobx.dart';


abstract class ControllerBase with Store{

   @observable
   String nome='';

   @observable
   String sobrenome='';
   
   @computed
   String get nomecompleto => "$nome $sobrenome";

   @action
   mudarNome(String newName){
     nome = newName;
   }

   @action
   mudarSobreNome(String newName){
     sobrenome = newName;
   }


}