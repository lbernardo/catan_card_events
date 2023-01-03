import 'dart:io';

import 'package:eventos_catan/app/models/config.dart';
import 'package:eventos_catan/app/models/event.dart';
import 'package:eventos_catan/app/modules/config/config_store.dart';
import 'package:eventos_catan/app/modules/game/title_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'eras_store.dart';

class GameStore extends NotifierStore<Exception, List<Event>> {
  GameStore() : super([]);

  List<Event> deck = createDeck();
  List<Color> players = [];

  final ConfigStore config = Modular.get();
  final ErasStore erasStore = Modular.get();
  final TitleStore titleStore = Modular.get();

  initDeck() {
    deck.shuffle();
    players = config.state.players;
    for (int i = 0; i < deck.length; i++) {
      Color player = players.removeAt(0);
      deck[i].player = player;
      players.add(player);
    }
    deck.add(newYear());
    update(deck);
  }

  clearDeck() async {
    setLoading(true);
    deck = createDeck();
    deck.shuffle();
    deck.shuffle();
    if (players.length > 0) {
      for (int i = 0; i < deck.length; i++) {
        Color player = players.removeAt(0);
        deck[i].player = player;
        players.add(player);
      }
    }
    deck.add(newYear());
    update(deck);
    setLoading(false);
  }

  itsNewYear() async {
    if (config.state.withEras) {
      if (erasStore.state == config.state.eras) {
        Modular.to.navigate("/game/end_game");
        return;
      }
    }
    erasStore.updateEra();
    clearDeck();
  }
}
