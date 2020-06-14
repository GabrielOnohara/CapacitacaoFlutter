import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'controller.dart';



class BodyWidget extends StatelessWidget {

  

_textField({String labelText, onChanged,String Function() errorText}){
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

  final controller = GetIt.I.get<Controller>();

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(builder: (_){
               return _textField(
                 errorText: controller.validateName,
                 labelText: "Name",
                 onChanged: controller.client.changeName
                 );
            }),
            SizedBox(
              height: 20,
            ),
            Observer(builder: (_){
               return _textField(
                 errorText: controller.validateEmail,
                 labelText: "Email",
                 onChanged: controller.client.changeEmail
                 );
            }),
            SizedBox(
              height: 20,
            ),
            Observer(builder: (_){
               return _textField(
                 errorText: controller.validateCpf,
                 labelText: "Cpf",
                 onChanged: controller.client.changeCpf
                 );
            }),
            SizedBox(
              height: 50,
            ),
            Observer(builder: (_){
              return RaisedButton(
              onPressed: controller.isValid ? (){} : null, 
              child:Text("Salvar"), 
              );
            })
          ],
        ),
    );   
  }
} 