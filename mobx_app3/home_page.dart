import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxapp3/home_controller.dart';
import 'package:mobxapp3/models/item_model.dart';
import 'item_widget.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller =HomeController();

_dialog(){

   var model= ItemModel();

  showDialog(
    context: context,
    builder: (_) {
        return AlertDialog(
          title: Text('Adicionar Item'),
          content: TextField(
            onChanged: model.setTitle,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Novo Item',
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
              controller.addItem(model);
              Navigator.pop(context);
            }, 
            child: Text('Salvar'),
            ),
            FlatButton(
              onPressed: (){
                Navigator.pop(context);
            },
            child: Text('Cancelar'),
            ), 
          ],
        );
    },
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        actions: <Widget>[
          IconButton(
            icon: Observer( builder: (_){
              return Text(controller.totalChecked.toString());
              }),
             onPressed: null
             ),
        ],
        title: TextField(
          onChanged: controller.setFilter,
          decoration: InputDecoration(
             hintText: 'Pesquisa...',
          ),
        ),
      ),
      body: Observer( builder: (_){
              return ListView.builder(
           itemCount:controller.listFiltered.length,
           itemBuilder:(_, index){
             var item = controller.listFiltered[index];
             return ItemWidget(item: item, removeClicked: (){
               controller.deleteItem(item);
             },);
           },
        );
      },
      ), 
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
        _dialog();
      }),
      );
  }
}