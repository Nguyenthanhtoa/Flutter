import 'package:rxdart/subjects.dart';

class RxProperty<T> {

  RxProperty({T value}) {
    if (value != null)
      _subject.add(value);
  }

  final _subject = BehaviorSubject<T>();

  Stream<T> get stream => _subject.stream;

  T get value => _subject.value;
  accept(T value) => _subject.add(value);

  void close() {
    _subject.close();
  }
}