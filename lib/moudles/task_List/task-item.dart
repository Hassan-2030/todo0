import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo0/styles/colors.dart';

import '../../network/local/firerbase_ulits.dart';

class TaskItem extends StatelessWidget {
  String task;

  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: DrawerMotion(),
        extentRatio: 1 / 4,
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.red,
            label: 'Delate',
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(12),
          ),
          SlidableAction(
            onPressed: (context) {
              // task.id
              deleteTaskFromFierstore("task.id");
            },
            backgroundColor: Colors.red,
            label: 'Edit',
            icon: Icons.edit,
            borderRadius: BorderRadius.circular(12),
          )
        ],
      ),
      child: Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Row(
          children: [
            Container(
              width: 3,
              height: 80,
              color: PRIMARY_COLOR,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //task.title
                  Text(
                    'Task Title',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  //task.discription
                  Text('Task Discription'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 16),
              decoration: BoxDecoration(
                  color: PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(12)),
            ),
            Icon(
              Icons.done,
              size: 30,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
