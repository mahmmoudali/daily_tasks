import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:to_do_task_web/models/task.dart';
import 'package:to_do_task_web/providers/main_provider.dart';
import 'package:to_do_task_web/utilities/constants.dart';
import 'package:to_do_task_web/widgets/colors.dart';
import 'package:sizer/sizer.dart';

class TaskEntryField extends StatelessWidget {
  final TextEditingController controller;
  final int categoryId;
  const TaskEntryField({
    Key? key,
    required this.controller,
    required this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainProvider>(context);
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            // height: 5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MColors.background.withOpacity(.5),
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 1.w),
                  hintText: "enter your task details here",
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  border: InputBorder.none),
            ),
          ),
        ),
        SizedBox(width: 1.w),
        GestureDetector(
          onTap: () {
            controller.text.length > 0
                ? provider.addTask(Task.fromMap(
                    {CATEGORY_ID: categoryId, CONTENT: controller.text}))
                : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("you should enter data first!"),
                    backgroundColor: Theme.of(context).errorColor));
            controller.clear();
          },
          child: Container(
            width: 5.w,
            height: 7.h,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1),
              color: MColors.dark_mode_main,
            ),
            child: Icon(FontAwesomeIcons.plus, size: 15, color: Colors.white),
          ),
        )
      ],
    );
  }
}
