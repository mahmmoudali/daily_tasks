import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_task_web/screens/main_screen.dart';
import 'package:to_do_task_web/widgets/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  ThemeMode mainThemeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Daily Tasks',
          debugShowCheckedModeBanner: false,
          themeMode: mainThemeMode,
          theme: ThemeData(
            fontFamily: "Tajawal",
            primarySwatch: Colors.blue,
            backgroundColor: MColors.background.withOpacity(.8),
          ),
          darkTheme: ThemeData(
            fontFamily: "Tajawal",
            brightness: Brightness.dark,
            scaffoldBackgroundColor: MColors.dark_mode_main,
          ),
          home: MainScreen(),
        );
      },
    );
  }

  void changeTheme(ThemeMode themeMode) async {
    setState(() {
      mainThemeMode = themeMode;
      // mainThemeMode == ThemeMode.light
      //     ? Prefs.setThemeMode(Const.LIGHT)
      //     : Prefs.setThemeMode(Const.DARK);
    });
  }
}
