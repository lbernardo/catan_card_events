import 'package:flutter_triple/flutter_triple.dart';

class TitleStore extends NotifierStore<Exception, String> {
  TitleStore() : super("Catan");

  clearTitle() {
    update("Catan");
  }

  updateTitle(String title) {
    update(title);
  }
}
