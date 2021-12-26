import 'package:to_do_task_web/utilities/constants.dart';

class Task {
  late int _id;
  late String _content;
  late int _categoryId;

  Task.fromMap(Map<String, dynamic> data) {
    _id = data['$ID'] == null ? 0 : data['$ID'];
    _content = data['$CONTENT'];
    _categoryId = data['$CATEGORY_ID'];
  }
  Map<String, dynamic> toMap() {
    return {
      // '$ID': _id,
      '$CONTENT': _content,
      '$CATEGORY_ID': _categoryId,
    };
  }

  int get id => _id;

  int get categoryId => _categoryId;

  String get content => _content;
}
