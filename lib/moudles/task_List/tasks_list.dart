import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:todo0/moudles/task_List/task-item.dart';
import 'package:todo0/styles/colors.dart';

import '../../models/task.dart';
import '../../network/local/firerbase_ulits.dart';

class TasksListTap extends StatefulWidget {
  @override
  State<TasksListTap> createState() => _TasksListTapState();
}

class _TasksListTapState extends State<TasksListTap> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
            selectedDate = date;
            setState(() {});
          },
          shrink: true,
          leftMargin: 20,
          monthColor: Colors.black,
          dayColor: PRIMARY_COLOR,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: PRIMARY_COLOR,
          dotsColor: Color(0xFF333A47),
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        FutureBuilder<QuerySnapshot<Task>>(
          future: getTasksFromFierstore(selectedDate),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Some thing wnet wrong'));
            }
            List<Task> tasks =
                snapshot.data?.docs.map((element) => element.data()).toList() ??
                    [];
            return Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  // tasks[index]
                  return TaskItem("tasks[index]");
                },
              ),
            );
          },
        )
      ],
    );
  }
}
