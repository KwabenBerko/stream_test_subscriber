# stream_test_subscriber

`stream_test_subscriber` is a Dart package that simplifies testing streams
by providing a straightforward API for subscribing to and asserting values from a stream.
It allows you to easily collect emitted values, verify their sequence, and handle asynchronous
stream events in tests. Ideal for unit testing stream-based code with minimal boilerplate.

## Features

1. Easy Subscription: Subscribes to a stream and collects emitted values for testing.
2. Value Assertions: Assert that the stream has emitted a specific sequence of values.
3. Empty Stream Check: Verify that no values have been emitted by the stream.
4. Resource Cleanup: Automatically cancels the internal subscription after assertions to prevent
   resource leaks.

## Getting started

### Prerequisites

To use `stream_test_subscriber`, ensure you have the following:

1. Dart SDK `2.12.0` or later.
2. A Flutter or Dart project.

### Installation

Add `stream_test_subscriber` to your pubspec.yaml:

```yaml
dependencies:
  stream_test_subscriber: ^1.0.0
```

Then, run `flutter pub get` to install the package.

## Usage

### Basic Setup

Here's a basic example of how to use `stream_test_subscriber` to subscribe to and assert values from
a stream in a test:

```dart
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
```
