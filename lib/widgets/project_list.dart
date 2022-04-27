import 'package:expenses_management/models/project.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ProjectList extends StatelessWidget{

  final List<Project> projects;
  final Function deletePr;

  ProjectList(this.projects, this.deletePr);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),

          child : ListTile(
              leading : GestureDetector(
                child: Container(
                  width: 120,
                  height: 50,
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                     border: Border.all(
                     color: Colors.black,
                     width: 2,
                  ),
                ),
                  child: Text(projects[index].title.toString(), textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xff64116f),)),
              ),
              ),

                title: Text(projects[index].manager.toString(), style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),),
                subtitle: Text(projects[index].due_date.toString(),
                    style: TextStyle(color: Colors.grey)),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () => deletePr(projects[index].title)
                ),
              ),
            );
        },
        itemCount: projects.length,
        ),
      );
    }
}

