import 'package:expenses_management/widgets/new_project.dart';
import 'package:expenses_management/widgets/project_list.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'models/project.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Management',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  final List<Project> _userProject = [
  Project( title: 'Toll Operations' , manager: 'Samarth', due_date: 'Nov 23, 2022'),
  Project( title: 'React Application', manager: 'Samarth', due_date: 'Dec 06, 2023'),
  Project(title: 'Flutter Application', manager: 'Samarth', due_date: 'June 28, 2024'),
  ];
  void _addNewProject(String pr_title, String pr_manager, String pr_due_date) {
  final newPr = Project(title: pr_title, manager: pr_manager, due_date: pr_due_date);

  setState(() {
  _userProject.add(newPr);
  });
  }



  void _startAddNewProject(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(
          onTap : (){},
          child: NewProject(_addNewProject),
          behavior : HitTestBehavior.opaque,
       );
     },
    );
  }

  void _deleteProject(String title) {
    setState(() {
      _userProject.removeWhere((Pr) => Pr.title== title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Project Management'),
        backgroundColor: Color(0xff004394),
        actions : <Widget>[
          IconButton(onPressed: (){}, icon: Icon(Icons.add))
      ]
      ),
      body: SingleChildScrollView(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.spaceAround,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[

           Container(
              height : 50,
              width: 400,
              child: Card(
                  child: TextField(decoration : InputDecoration(
                    labelText: 'Search for projects',
                    prefixIcon: Icon(Icons.search),
                  ),textAlign: TextAlign.left,style: TextStyle(fontSize: 18,color: Colors.grey),
              ),elevation : 2
              )
           ),
           Container(
             height: 95, padding: EdgeInsets.all(30),
             child: Text('Recent Projects', textAlign: TextAlign.center,style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black) )),

           ProjectList(_userProject, _deleteProject),
         ]
        )
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color(0xff004394),
          onPressed: (){
            _startAddNewProject(context);
          },
        ),
    );
  }
}
