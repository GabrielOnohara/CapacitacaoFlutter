import 'package:flutter/material.dart';
import 'package:appfinal/task.dart';
import 'task_list.dart';
import 'task_form.dart';


 void main(){
    runApp(MaterialApp(
      home: HomePage(),
    ));
 }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  
  final List<Task> tasks = [];

    
  addTask(String title,DateTime date,Color color){

    final  newTask = Task(
      id: DateTime.now().millisecond.toString(),
      title: title,
      date: date,
      color:color,
      
    );

    setState(() {
      tasks.add(newTask);
    });

    Navigator.of(context).pop();
  }

  _removeTask(String id){
    setState(() {
      tasks.removeWhere((tr) => tr.id == id);
    });
  }

  _openTaskFormModal(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (_){
         return TaskForm(addTask);
      },
      );
  }

    

 Widget _getIconButton(IconData icon, Function fn){
   return IconButton(
     icon: Icon(icon), 
     onPressed: fn);
 }

  @override
  Widget build(BuildContext context) {
    
    
      final mediaQuery = MediaQuery.of(context);

      final actions = <Widget> [
        _getIconButton(
          Icons.add,
          () => _openTaskFormModal(context),
         ),
      ];

      final PreferredSizeWidget appBar = 
       AppBar(
         backgroundColor: Colors.orangeAccent,
         title: Text('Minhas Tarefas '),
         actions: actions,
       );
      

      
      final avaliableHeight = mediaQuery.size.height - 
      appBar.preferredSize.height - 
      mediaQuery.padding.top;
      

      final bodyPage = SafeArea(
        child: SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset("images/Ocupado.jfif",
              fit: BoxFit.cover,
              ),
              Container(
                height: avaliableHeight* 0.7,
                child: TaskList(tasks, _removeTask),
              ),
            ],
          )
        )
      );


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body:   bodyPage, 
      floatingActionButton: FloatingActionButton(
        onPressed:() => _openTaskFormModal(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.orangeAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}