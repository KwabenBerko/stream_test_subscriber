import 'dart:async';

import 'package:test/expect.dart';

/// A utility class that subscribes to a stream and collects its emitted values.
class StreamTestSubscriber<T> {
  late StreamSubscription<T> _subscription;
  final _values = <T>[];

  StreamTestSubscriber(Stream<T> stream) {
    _subscription = stream.listen(_values.add);
  }

  /// Asserts that the stream has not emitted any values.
  Future<void> expectEmpty() async {
    await _flushMicroTasks();
    expect(_values, isEmpty);
    _cancelSubscription();
  }

  /// Asserts that the values emitted by the stream matches the expected sequence.
  Future<void> expectValues(Iterable<T> values) async {
    await _flushMicroTasks();
    expect(_values, orderedEquals(values));
    _cancelSubscription();
  }

  void _cancelSubscription() => _subscription.cancel();

  /// A function to ensure that all pending micro tasks are completed.
  Future<void> _flushMicroTasks() => Future<void>.delayed(Duration.zero);
}

/// Extension on Stream to provide testing utilities.
extension StreamExtensions<T> on Stream<T> {
  /// Subscribes to the stream and returns a [StreamTestSubscriber], which
  /// can be used to collect and assert values emitted by the stream.
  StreamTestSubscriber<T> test() {
    return StreamTestSubscriber(this);
  }
}
