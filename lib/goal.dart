import 'counter_storage.dart';

class Goal {
  String title;
  bool _isComplete;

  // toggle completion
  void toggleCompletion() {
    _isComplete = !_isComplete;
  }
}
