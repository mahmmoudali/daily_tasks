import 'package:flutter/material.dart';
import 'package:to_do_task_web/main.dart';
import 'package:to_do_task_web/models/task.dart';
import 'package:to_do_task_web/widgets/colors.dart';
import 'package:sizer/sizer.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  const TaskItem({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(task.content),
              actions: [
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                        alignment: Alignment.center,
                        width: 10.w,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: MyApp.of(context)!.mainThemeMode ==
                                    ThemeMode.light
                                ? MColors.dark_brown
                                : MColors.dark_brown),
                        child: Text(
                          "Done",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                )
              ],
            );
          },
        );
      },
      child: Container(
          margin: EdgeInsets.all(.5.w),
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          decoration: BoxDecoration(
              color: MyApp.of(context)!.mainThemeMode == ThemeMode.light
                  ? Colors.white
                  : MColors.dark_mode_main.withOpacity(.7),
              borderRadius: BorderRadius.circular(5)),
          child: Text(
            task.content,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: MyApp.of(context)!.mainThemeMode == ThemeMode.light
                    ? MColors.dark_brown
                    : Colors.white),
          )),
    );
  }
}
