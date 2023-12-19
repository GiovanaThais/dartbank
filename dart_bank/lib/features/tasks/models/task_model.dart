import 'package:flutter/material.dart';

class TaskModel {
  final String _id = UniqueKey().toString();
  String _description = "";
  bool _done = false;

  TaskModel(this._description, this._done);

  String get id => _id;

  String get description => _description;

  set description(String description) {
    _description = description;
  }

  bool get done => _done;

  set done(bool done) {
    _done = done;
  }
}
