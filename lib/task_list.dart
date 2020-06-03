import 'package:flutter/material.dart';
import 'task.dart';
import 'package:intl/intl.dart';


class TaskList extends StatefulWidget {      
final List<Task> tasks;
  final void Function(String) onRemove;

  
 
  @override

  
     
  _TaskListState createState() => _TaskListState();
     
     TaskList(this.tasks, this.onRemove); 
}

class _TaskListState extends State<TaskList> {
   
    
  
  @override
  Widget build(BuildContext context) {
    return widget.tasks.isEmpty
    ?LayoutBuilder(
      builder: (ctx, constraints){
        return Column(
          children: <Widget>[
             SizedBox(height: 20),
             Text(
               "Nenhuma Tarefa Cadastrada..",
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 25.0,
               ),
             )
          ],
        );
      },
    )
    :ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (ctx, index){
      final tr = widget.tasks[index];
      return Card(
        elevation: 5,
        margin:  EdgeInsets.symmetric(
          horizontal: 5,
          vertical:8,
         ),
         child: ListTile(
           leading: CircleAvatar(
             foregroundColor: Colors.white,
             backgroundColor:
             tr.color
             ,     
             radius: 20,
             child: Padding(
                      
                      padding: const EdgeInsets.all(6),
                        child: Icon(
                          Icons.assignment_late
                        ) 
                         ),
             ),
           title: Text(
             tr.title,
             style: TextStyle(
               color: Colors.black,
               fontWeight: FontWeight.bold,
               fontSize: 20,
             ),
           ),
           subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                  ),
           trailing:  
                  IconButton(
                     icon: Icon(Icons.delete),
                     color: Theme.of(context).errorColor,
                    onPressed: ()=>widget.onRemove(tr.id),
                ),
           ),
         ); 
       } ,
    );
  }
}