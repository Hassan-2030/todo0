import 'package:flutter/material.dart';
import 'package:todo0/models/task.dart';
import 'package:todo0/styles/colors.dart';

import '../network/local/firerbase_ulits.dart';
import '../shared/components/components.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'add new task',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: BLACE_COLOR),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value == '') {
                          return 'plear Enter your title';
                        }
                      },
                      controller: titleController,
                      decoration: InputDecoration(
                          label: Text('title'),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: PRIMARY_COLOR)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: PRIMARY_COLOR))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: descriptionController,
                      validator: (value) {
                        if (value == null || value == '') {
                          return 'Please Enter your description';
                        }
                      },
                      maxLines: 3,
                      decoration: InputDecoration(
                          label: Text('description'),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: PRIMARY_COLOR)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: PRIMARY_COLOR))),
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              'SelectData',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: BLACE_COLOR),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                SelectDate(context);
              },
              child: Text(
                // Search format date
                '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: PRIMARY_COLOR,
                    fontSize: 19,
                    fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Task task = Task(
                      title: titleController.text,
                      description: descriptionController.text,
                      date: DateUtils.dateOnly(selectedDate)
                          .microsecondsSinceEpoch,
                    );

                    showLoading(context, 'Loading...');

                    AddTaskToFierstore(task).then((value) {
                      hideLoading(context);
                      showMassege(context, 'Successfully', 'Added Task', 'ok',
                          () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                          isCansellabal: false,
                          negBtn: 'Cancel',
                          negAction: () {});
                    });
                  }
                  ;
                },
                child: Text('add task'))
          ],
        ),
      ),
    );
  }

  void SelectDate(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate == null) return;
    selectedDate = chosenDate;
    setState(() {});
  }
}
