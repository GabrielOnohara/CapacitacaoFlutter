import 'package:flutter/material.dart';
import 'adaptative_textField.dart';
import 'adaptative_date_picker.dart';
import 'adptative_button.dart';
class TaskForm extends StatefulWidget {
     final void Function (String,DateTime,Color) onSubmit;
     TaskForm(this.onSubmit);
     


  @override
  _TaskFormState createState() => _TaskFormState();
}

    DateTime oldDate= DateTime.now();

class _TaskFormState extends State<TaskForm> {

      final _titleController = TextEditingController();
      DateTime selectedate = DateTime.now();
      Color newColor;

      
      

      _submitTask(){
        final title = _titleController.text;
        if(selectedate.day.roundToDouble() - oldDate.day.roundToDouble()<=2){
          newColor=Colors.red;
        }else if(selectedate.day.roundToDouble() - oldDate.day.roundToDouble()<=7){
          newColor=Colors.yellow;
        }else{
          newColor=Colors.green;
        }

         if(title.isEmpty|| selectedate==null ){
           return;
         }

        widget.onSubmit(title, selectedate,newColor);
      }

    

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Card(
          elevation: 5,
          child: Padding(

            padding: EdgeInsets.only(
              top:10,
              right:10,
              left:10,
              bottom:10+ MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
            children: <Widget>[
              AdaptativeTextField(
              keyboardType: TextInputType.text,
              label: 'Digite sua Tarefa :)',
              controller: _titleController,
              onSubmitted: (_) => _submitTask,
            ),
            AdaptativeDatePicker(
              selectedDate: selectedate,
              onDateChanged: (newDate){
                setState(() {
                  selectedate=newDate;
                });
              } ,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                AdaptativeButton(
                  label: 'Nova Tarefa',
                  onPressed: _submitTask,
                ),
              ],
            )
            ],
            
           ), 
       ),
     ),
    );
  }
}