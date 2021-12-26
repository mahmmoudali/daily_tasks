import 'package:flutter/material.dart';
import 'package:to_do_task_web/main.dart';
import 'package:to_do_task_web/widgets/colors.dart';
import 'package:sizer/sizer.dart';

class TaskCategoryHeader extends StatelessWidget {
  final String title;
  final int numerOfTasks;
  const TaskCategoryHeader({
    Key? key,
    required this.title,
    required this.numerOfTasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      width: double.infinity,
      margin: EdgeInsets.all(1),
      height: 5.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: MyApp.of(context)!.mainThemeMode == ThemeMode.light
              ? Colors.white
              : MColors.dark_mode_main.withOpacity(.7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              textScaleFactor: MediaQuery.textScaleFactorOf(context),
              style: TextStyle(
                  height: 1.5,
                  color: MyApp.of(context)!.mainThemeMode == ThemeMode.light
                      ? MColors.dark_brown
                      : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Container(
            alignment: Alignment.center,
            // padding: EdgeInsets.all(.5.w),
            height: 4.h,
            width: 4.h,
            decoration: BoxDecoration(
                color: MColors.dark_brown,
                borderRadius: BorderRadius.circular(5)),
            child: Text("$numerOfTasks",
                style:
                    TextStyle(height: 1.5, fontSize: 16, color: Colors.white)),
          )
        ],
      ),
    );
  }
}
