import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/ui/constants/constants.dart';
import 'package:task_manager/ui/home_page_viewmodel.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<TaskListViewModel>(context);
    //target size: 24
    //checkbox const width: 18.
    double scaleFactor = 24 / 18;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Expanded(
      child: ListView.builder(
        itemCount: model.tasks.length,
        itemBuilder: (_, index) => GestureDetector(
          child: ListTile(
            onTap: () => model.changeTaskState(
              !model.tasks[index].completed,
              model.tasks[index],
            ),
            minLeadingWidth: 40 * (scaleFactor - 1),
            leading: Transform.scale(
              scale: scaleFactor,
              child: Container(
                decoration: BoxDecoration(
                  gradient: isDarkMode ? UIConstants.checkBoxGradientDarkTheme : UIConstants.checkBoxGradientLightTheme,
                  borderRadius: BorderRadius.circular(5 / scaleFactor),
                ),
                child: Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5 / scaleFactor)),
                  side: BorderSide(
                      width: 2 / scaleFactor,
                      color: Theme.of(context).checkboxTheme.side!.color),
                  value: model.tasks[index].completed,
                  onChanged: (bool? newValue) => model.changeTaskState(
                    newValue,
                    model.tasks[index],
                  ),
                ),
                height: 18,
                width: 18,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 24 * scaleFactor),
            title: Text(
              model.tasks[index].task,
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
