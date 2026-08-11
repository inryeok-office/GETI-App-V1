import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_view_model.g.dart';

@riverpod
class CounterViewModel extends _$CounterViewModel {
  @override
  int build() => 0;

  void increment() {
    state++;
  }
}
