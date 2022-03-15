import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/header.dart';
import 'package:task_manager/ui/widgets/new_task.dart';
import 'package:task_manager/ui/widgets/task_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: const[
            HeaderWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(height: 1),
            ),
            NewTaskWidget(),
            TaskListWidget(),
          ],
        ),
      ),
    );
  }
}
