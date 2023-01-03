import 'package:eventos_catan/app/models/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class ConfigStore extends NotifierStore<Exception, Config> {
  ConfigStore() : super(Config(withEras: false, eras: 3, players: []));

  setConfig(bool withEras, int eras, List<Color> players) {
    players.shuffle();
    update(Config(withEras: withEras, eras: eras, players: players));
  }

  setPlayers(List<Color> players) {
    Config config = this.state;
    config.players = players;
    update(config);
  }
}
