import 'package:eventos_catan/app/models/config.dart';
import 'package:flutter_triple/flutter_triple.dart';

class ConfigStore extends NotifierStore<Exception, Config> {
  ConfigStore() : super(Config(withEras: false, eras: 3));

  setConfig(bool withEras, int eras) {
    update(Config(withEras: withEras, eras: eras));
  }
}
