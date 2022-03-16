import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/ui/constants/constants.dart';
import 'package:task_manager/ui/home_page_viewmodel.dart';

class NewTaskWidget extends StatefulWidget {
  const NewTaskWidget({Key? key}) : super(key: key);

  @override
  State<NewTaskWidget> createState() => _NewTaskWidgetState();
}

class _NewTaskWidgetState extends State<NewTaskWidget> {
  late StreamSubscription<bool> _keyboardSubscription;
  final _node = FocusNode();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    var model = Provider.of<TaskListViewModel>(context, listen: false);

    _keyboardSubscription =
        KeyboardVisibilityController().onChange.listen((bool visible) {

      if (!visible) {
        model.addNewTask(_controller.text);
        _controller.clear();
        _node.unfocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isNewTask =
        context.select((TaskListViewModel model) => model.isNewTask);
    double scaleFactor = 24 / 18;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Visibility(
      visible: isNewTask,
      child: ListTile(
        minLeadingWidth: 40 * (scaleFactor - 1),
        leading: Transform.scale(
          scale: scaleFactor,
          child: Container(
            decoration: BoxDecoration(
              gradient: isDarkMode ? UIConstants.checkBoxGradientDarkTheme : UIConstants.checkBoxGradientLightTheme,
              borderRadius: BorderRadius.circular(5 / scaleFactor),
            ),
            child: Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5 / scaleFactor)),
              side: BorderSide(
                  width: 2 / scaleFactor,
                  color: Theme.of(context).checkboxTheme.side!.color),
              value: false,
              onChanged: null,
            ),
            height: 18,
            width: 18,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 24 * scaleFactor),
        title: TextField(
          focusNode: _node,
          controller: _controller,
          autofocus: true,
          style: TextStyle(color: Theme.of(context).listTileTheme.textColor,),
          decoration: InputDecoration(
            hintStyle: GoogleFonts.inter(
              textStyle: TextStyle(
                color: Theme.of(context).inputDecorationTheme.hintStyle!.color,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            hintText: 'New task',
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _keyboardSubscription.cancel();
    _node.dispose();
    _controller.dispose();
    super.dispose();
  }
}
