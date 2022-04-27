import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewProject extends StatefulWidget {
  final Function addPr;

  NewProject(this.addPr);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewProject>{
  final projectnamecontroller = TextEditingController();
  final managernamecontroller = TextEditingController();
  final duedatecontroller = TextEditingController();

  void _submitData(){
    final enteredTitle = projectnamecontroller.text;
    final enteredManager = managernamecontroller.text;
    final enteredDueDate = duedatecontroller.text;

    if (enteredTitle.isEmpty || enteredManager.isEmpty || enteredDueDate.isEmpty){
      return;
    }
    widget.addPr(
      enteredTitle, enteredManager, enteredDueDate);
    Navigator.of(context).pop();
  }

  // void _presentDatePicker() {
  //   showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(2022),
  //       lastDate: DateTime(2030)
  //   ).then((pickedDate) {
  //     if (pickedDate == null){
  //       return;
  //     }
  //     setState(() {
  //       duedate = pickedDate;
  //
  //     });

    // });
  // }

  @override

  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Project Name'),
              controller: projectnamecontroller,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Manager Name'),
              controller: managernamecontroller,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            TextField(
              decoration: InputDecoration(labelText : 'Due Date'),
              controller: duedatecontroller,
              // onChanged : (val){}
            ),
            RaisedButton(
                child: Text('Add Project', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                onPressed: () => _submitData(),
                color: Color(0xff004394))
          ],
        ),
      ),
    );
  }
}


//   Widget build(BuildContext context) {
//     return Card (elevation: 5, child : Container(padding: EdgeInsets.all(10),child: Column(
//       crossAxisAlignment : CrossAxisAlignment.stretch,
//       children: <Widget>[
//         TextField(
//             decoration: InputDecoration(labelText : 'Name of Project'),
//             controller: projectnamecontroller,
//             // onChanged : (val){
//             //   projectnameInput = val;}
//           ),
//         TextField(
//             decoration: InputDecoration(labelText : 'Name of Manager'),
//             controller: managernamecontroller,
//             // onChanged : (val){}
//           ),
//         TextField(
//           decoration: InputDecoration(labelText : 'Due Date'),
//           controller: duedatecontroller,
//           // onChanged : (val){}
//         ),
//
//         // FlatButton(
//         //     height: 60,
//         //     onPressed: () {_presentDatePicker();},
//         //     child: Text('Select Due Date', style: TextStyle(color: Colors.purple, fontSize: 16,fontWeight: FontWeight.bold))
//         // ),
//         // Container(
//         //   height: 70,
//         //   child: Row(
//         //     children: <Widget>[
//         //       Expanded(
//         //         child: Text(
//         //           _duedate == null
//         //               ? 'No Date Chosen!'
//         //               : 'Due Date Picked',
//         //         ),
//         //       ),
//         //       FlatButton(
//         //         textColor: Theme.of(context).primaryColor,
//         //         child: Text(
//         //           'Choose Date',
//         //           style: TextStyle(
//         //             fontWeight: FontWeight.bold,
//         //           ),
//         //         ),
//         //         onPressed: _presentDatePicker,
//         //       ),
//         //     ],
//         //   ),
//         // ),
//
//         RaisedButton(
//           child: Text('Add Project', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),)
//             ,onPressed: () => _submitData(),
//           color: Color(0xff004394)
//         )],),
//     ));
//   }
// }