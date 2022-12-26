import 'dart:io';

import 'package:eventos_catan/app/models/config.dart';
import 'package:eventos_catan/app/models/event.dart';
import 'package:eventos_catan/app/modules/config/config_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'eras_store.dart';

class GameStore extends NotifierStore<Exception, Event> {
  GameStore() : super(none());
  bool isNewYear = false;
  int countYears = 0;

  List<Event> deck = createDeck();

  final ConfigStore config = Modular.get();
  final ErasStore erasStore = Modular.get();

  @override
  void initStore() {
    super.initStore();
    deck.shuffle();
    deck.add(newYear());
  }

  clearDeck() async {
    setLoading(true);
    deck = createDeck();
    isNewYear = false;
    countYears = 0;
    deck.shuffle();
    deck.shuffle();
    deck.add(newYear());
    update(none());
    setLoading(false);
  }

  nextCard() async {
    if (!isNewYear) {
      setLoading(true);
      Event card = deck[0];
      deck.removeAt(0);
      update(card);

      if (card.newYear) {
        isNewYear = true;
      }
      setLoading(false);
    } else {
      itsNewYear();
    }
  }

  itsNewYear() async {
    isNewYear = false;
    erasStore.updateEra();
    if (config.state.withEras) {
      countYears = countYears + 1;
      if (countYears == config.state.eras) {
        Modular.to.navigate("/game/end_game");
        return;
      }
    }
    setLoading(true);
    deck = createDeck();
    isNewYear = false;
    deck.shuffle();
    deck.add(newYear());
    update(none());
    setLoading(false);
  }
}
