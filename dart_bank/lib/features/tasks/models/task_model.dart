import 'package:flutter/material.dart';

class TaskModel {
  final String _id = UniqueKey().toString();
  String _description = "";
  bool _done = false;

  TaskModel(this._description, this._done);

  String getId() {
    return _id;
  }

  String getDescription(description) {
    return _description;
  }

  void setDescription(String description) => _description = description;

  bool getDone() {
    return _done;
  }

  void setDone(bool done) => _done = done;
}
