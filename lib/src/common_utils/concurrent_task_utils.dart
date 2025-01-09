// Chạy số lượng task định trước cùng một lúc
import 'dart:collection';

import 'package:flutter/material.dart';

import 'l.dart';

class ConcurrentTaskUtils<A, B> {
  int maxConcurrentTasks;
  int _runningTasks = 0;
  VoidCallback? completeAllTask;
  ConcurrentTaskUtils(this.task, {this.maxConcurrentTasks = 5, this.completeAllTask});
  final Queue<A> _input = Queue();
  final Future<B> Function(A) task;

  void addAll(Iterable<A> iterable) {
    _input.addAll(iterable);
    _startExecution();
  }

  add(A task) {
    _input.add(task);
    _startExecution();
  }

  void _startExecution() {
    if (_runningTasks >= maxConcurrentTasks || _input.isEmpty) {
      return;
    }
    _runningTasks++;
    L.d('Concurrent workers: $_runningTasks');
    task(_input.removeFirst()).whenComplete(() {
      _runningTasks--;
      L.d('Concurrent workers: $_runningTasks');
      if (completeAllTask!=null && _runningTasks <= 0 && _input.isEmpty) {
        completeAllTask?.call();
      }
      _startExecution();
    });
    _startExecution();
  }
}
