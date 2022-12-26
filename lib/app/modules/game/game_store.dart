import 'dart:io';

import 'package:eventos_catan/app/models/card.dart';
import 'package:eventos_catan/app/models/config.dart';
import 'package:eventos_catan/app/modules/config/config_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'eras_store.dart';

class GameStore extends NotifierStore<Exception, GameCard> {
  GameStore() : super(GameCard("assets/cards/none.png"));
  bool isNewYear = false;
  int countYears = 0;

  List<GameCard> deck = createDeck();
  final ConfigStore config = Modular.get();
  final ErasStore erasStore = Modular.get();

  @override
  void initStore() {
    super.initStore();
    deck.shuffle();
    deck.add(GameCard("assets/cards/new_year.png", newYear: true));
  }

  clearDeck() async {
    setLoading(true);
    deck = createDeck();
    isNewYear = false;
    countYears = 0;
    deck.shuffle();
    deck.add(GameCard("assets/cards/new_year.png", newYear: true));
    update(GameCard("assets/cards/none.png"));
    setLoading(false);
  }

  nextCard() async {
    // print("Clicou");
    if (!isNewYear) {
      setLoading(true);
      GameCard card = deck[0];
      // print("Remove ${card.imageName}");
      deck.removeAt(0);
      // print("Show card ${card.imageName}");
      update(card);

      // If is new year refresh game
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
    deck.add(GameCard("assets/cards/new_year.png", newYear: true));
    await Future.delayed(Duration(seconds: 2));
    update(GameCard("assets/cards/none.png"));
    setLoading(false);
  }
}
