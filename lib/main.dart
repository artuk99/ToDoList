import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/config/app_theme.dart';
import 'package:task_manager/ui/home_page.dart';
import 'package:task_manager/ui/home_page_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routes: {
        '/': (_) => ChangeNotifierProvider<TaskListViewModel>(
              create: (context) => TaskListViewModel(),
              child: const HomePage(),
            ),
      },
    );
  }
}
