import 'package:flutter/material.dart';

import '../moudles/setteing/sittings.dart';
import '../moudles/task_List/tasks_list.dart';
import '../styles/colors.dart';
import 'add_bottom_sheet.dart';

class HomeLayout extends StatefulWidget {
  static const String routName = 'home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text('Route Tasks'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddTaskBottomSheett();
        },
        child: Icon(Icons.add),
        shape: StadiumBorder(side: BorderSide(color: WHITE_COLOR, width: 3)),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          currentIndex: currentIndex,
          onTap: (context) {
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  size: 30,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                ),
                label: '')
          ],
        ),
      ),
      body: tabs[currentIndex],
    );
  }

  void AddTaskBottomSheett() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskBottomSheet(),
          );
        });
  }

  List<Widget> tabs = [TasksListTap(), SittingsTap()];
}
