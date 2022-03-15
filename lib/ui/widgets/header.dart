import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';
import 'package:task_manager/ui/home_page_viewmodel.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isNewTask =
        context.select((TaskListViewModel model) => model.isNewTask);
    final model = Provider.of<TaskListViewModel>(context, listen: false);

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Tasks',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(height: 56, width: 56),
            child: ElevatedButton(
              child: const Icon(
                Icons.add,
                size: 24,
              ),
              onPressed: isNewTask ? null : () => model.showTextField(),
            ),
          ),
        ],
      ),
    );
  }
}
