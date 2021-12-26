import 'package:flutter/cupertino.dart';
import 'package:to_do_task_web/models/task.dart';

class MainProvider extends ChangeNotifier {
  late List<Task> _nextUpList = [];
  late List<Task> _inProgressList = [];
  late List<Task> _completedList = [];

  get nextUpList => this._nextUpList;

  addTask(Task task) {
    switch (task.categoryId) {
      case 0:
        this._nextUpList.add(task);
        break;
      case 1:
        this._inProgressList.add(task);
        break;
      case 2:
        this._completedList.add(task);
        break;
    }
    notifyListeners();
  }

  get inProgressList => this._inProgressList;

  get completedList => this._completedList;
}
