import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_task_web/main.dart';
import 'package:to_do_task_web/providers/main_provider.dart';
import 'package:to_do_task_web/widgets/colors.dart';
import 'package:provider/provider.dart';
import 'package:to_do_task_web/widgets/task_category_item.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TextEditingController nextUpCont;
  late TextEditingController inProgCont;

  late TextEditingController completedCont;

  @override
  void initState() {
    nextUpCont = TextEditingController();
    inProgCont = TextEditingController();

    completedCont = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    nextUpCont.dispose();
    inProgCont.dispose();
    completedCont.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => MainProvider(),
        builder: (context, child) {
          final provider = Provider.of<MainProvider>(context, listen: true);
          return Scaffold(
            appBar: appBar(context),
            body: Container(
              margin: EdgeInsets.symmetric(vertical: 5.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TaskCategoryItem(
                          categoryId: 0,
                          controller: nextUpCont,
                          title: "Next up",
                          taskList: provider.nextUpList),
                      TaskCategoryItem(
                          categoryId: 1,
                          controller: inProgCont,
                          title: "In progress",
                          taskList: provider.inProgressList),
                      TaskCategoryItem(
                          categoryId: 2,
                          controller: completedCont,
                          title: "Completed",
                          taskList: provider.completedList),
                      // decorationBtn(context)
                    ],
                  ),
                  // decorationBtn(context)
                ],
              ),
            ),
          );
        });
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black.withOpacity(.1),
      elevation: 0,
      leading: Container(
          padding: EdgeInsets.all(7),
          height: 5.h,
          width: 5.h,
          child: Image.asset(
            "assets/images/logo.png",
            color: MyApp.of(context)!.mainThemeMode == ThemeMode.light
                ? MColors.dark_brown
                : Colors.white,
          )),
      title: Text(
        "Daily Tasks",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: MyApp.of(context)!.mainThemeMode == ThemeMode.light
                ? MColors.dark_brown
                : Colors.white),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () {
                MyApp.of(context)!.mainThemeMode == ThemeMode.light
                    ? MyApp.of(context)!.changeTheme(ThemeMode.dark)
                    : MyApp.of(context)!.changeTheme(ThemeMode.light);
              },
              child: MyApp.of(context)!.mainThemeMode == ThemeMode.light
                  ? Icon(
                      FontAwesomeIcons.moon,
                      color: MColors.dark_brown,
                    )
                  : Icon(FontAwesomeIcons.solidMoon)),
        )
      ],
    );
  }
}
