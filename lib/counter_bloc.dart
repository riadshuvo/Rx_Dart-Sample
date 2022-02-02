import 'dart:developer';

import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int initialValue = 0;

  //PublishSubject<int>? _subject;
  BehaviorSubject<int>? _subject;

  CounterBloc() {
    //_subject = PublishSubject<int>();
    _subject = BehaviorSubject<int>();
  }

  Stream<int> get getValue => _subject!.stream;

  increment() {
    _subject!.stream.listen((event) {
      log(initialValue.toString());
    });

    initialValue = initialValue + 1;
    _subject!.sink.add(initialValue);
  }

  decrement() {
    initialValue = initialValue - 1;
    _subject!.sink.add(initialValue);
  }

  void dispose() {
    _subject!.close();
  }
}
