import 'package:mobx/mobx.dart';
import 'package:mobxapp3/models/item_model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store{
     
    ObservableList<ItemModel> listItens =[
      ItemModel(title: "Item 1" , check: true),
      ItemModel(title: "Item 2" , check: false),
      ItemModel(title: "Item 3" , check: false),
    ].asObservable();


    @computed
    int get totalChecked => listItens.where((element) => element.check).length;

    @computed
    List<ItemModel> get listFiltered {
      if(filter.isEmpty){
        return listItens;
      }else{
        return listItens.where((element) => element.title.toLowerCase().contains(filter.toLowerCase())).toList();
      }
    }

    @observable
    String filter = '';

    @action 
    setFilter(String value){
      filter = value;
    }

    @action
    addItem (ItemModel model){
      listItens.add(model);

    }

    @action
    deleteItem(ItemModel model){
      listItens.removeWhere((element) => element.title == model.title);
    }

}