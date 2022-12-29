import 'package:flutter_triple/flutter_triple.dart';

class Points extends NotifierStore<Exception, int> {
  Points(super.initialState);

  addPoint() {
    update(state + 1);
  }

  clearPoints() {
    update(3);
  }
}
