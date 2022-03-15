import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/ui/home_page.dart';
import 'package:task_manager/ui/home_page_viewmodel.dart';
import 'package:task_manager/ui/theme/app_dark_theme.dart';
import 'package:task_manager/ui/theme/app_light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appLightTheme,
      darkTheme: appDarkTheme,
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
