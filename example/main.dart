import 'dart:async';

import 'package:stream_test_subscriber/stream_test_subscriber.dart';
import 'package:test/test.dart';

void main() {
  test(
    "should emit values that has been collected from the stream",
    () async {
      final controller = StreamController<int>();
      final subscriber = controller.stream.test();

      for (var value in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) {
        controller.add(value);
      }

      await subscriber.expectValues([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    },
  );
}
