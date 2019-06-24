import 'dart:async';

void main() {
  Future(() {
    print('xss');
  });

  Future.delayed(Duration(seconds: 1), () {
    print('xss');
  });

  Future.microtask(() {
    print('a task');
  });

  Future.sync(() {
    print('sync future');
  });

  Future(() => print('task'))
      .then((_) => print('callback1'))
      .then((_) => print('callback2'));

  Future(() => throw 'we have a problem')
      .then((_) => print('callback1'))
      .then((_) => print('callback2'))
      .catchError((err) {
    print(err);
  });

  Future(() => throw 'we have a problem')
      .then((_) => print('callback1'))
      .then((_) => print('callback2'))
      .catchError((err) {
    print(err);
  }).whenComplete(() {
    print('complete');
  });

  Future.value(123).then((value) {
    print(value);
  });
}
