import 'package:flutter_triple/flutter_triple.dart';

class ErasStore extends NotifierStore<Exception, int> {
  ErasStore() : super(1);

  clearEra() {
    update(1);
  }

  updateEra() {
    update(state + 1);
  }
}
