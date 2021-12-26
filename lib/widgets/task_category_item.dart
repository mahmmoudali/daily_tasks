import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_task_web/main.dart';
import 'package:to_do_task_web/models/task.dart';
import 'package:to_do_task_web/widgets/colors.dart';
import 'package:to_do_task_web/widgets/task_category_header.dart';
import 'package:to_do_task_web/widgets/task_entry_field.dart';
import 'package:to_do_task_web/widgets/task_item.dart';
import 'package:sizer/sizer.dart';

class TaskCategoryItem extends StatelessWidget {
  final String title;
  final int categoryId;
  final TextEditingController controller;

  final List<Task> taskList;

  const TaskCategoryItem({
    Key? key,
    required this.title,
    required this.taskList,
    required this.categoryId,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        child: Column(
          children: [
            Container(
              height: 70.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: MColors.background.withOpacity(.5)),
              child: Column(
                children: [
                  TaskCategoryHeader(
                      title: title, numerOfTasks: taskList.length),
                  SizedBox(height: 1.h),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: taskList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return TaskItem(task: taskList[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h),
            TaskEntryField(
              categoryId: categoryId,
              controller: controller,
            )
          ],
        ),
      ),
    );
  }
}
