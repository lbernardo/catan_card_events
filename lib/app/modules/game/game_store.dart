import 'dart:io';

import 'package:eventos_catan/app/models/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class GameStore extends NotifierStore<Exception, GameCard> {
  GameStore() : super(GameCard("assets/cards/none.png"));
  bool isNewYear = false;
  List<GameCard> discard = [];

  List<GameCard> deck = createDeck();

  @override
  void initStore() {
    super.initStore();
    print("initStore");
    deck.shuffle();
    List<GameCard> afterNewYear = [
      GameCard("assets/cards/new_year.png", newYear: true)
    ];
    for (int i = 0; i < 5; i++) {
      GameCard card = deck.removeLast();
      afterNewYear.add(card);
    }
    deck.addAll(afterNewYear);
  }

  clearDeck() async {
    setLoading(true);
    deck = createDeck();
    discard = [];
    isNewYear = false;
    deck.shuffle();
    List<GameCard> afterNewYear = [
      GameCard("assets/cards/new_year.png", newYear: true)
    ];
    for (int i = 0; i < 5; i++) {
      GameCard card = deck.removeLast();
      afterNewYear.add(card);
    }
    deck.addAll(afterNewYear);
    await Future.delayed(Duration(seconds: 2));
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
      // print("Add to discard ${card.imageName}");
      if (!card.newYear) {
        discard.add(card);
      }
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
    setLoading(true);
    isNewYear = false;
    List<GameCard> afterNewYear = [
      GameCard("assets/cards/new_year.png", newYear: true)
    ];
    // shuffle discard
    discard.shuffle();
    print("Remove latest 5 cards");
    // get latest 5 cards to add in afterNewYear
    for (int i = 0; i < 5; i++) {
      GameCard card = discard.removeLast();
      afterNewYear.add(card);
    }
    // Add deck to discard
    print("add deck to discard");
    discard.addAll(deck);
    // shuffle cards
    print("shuffle discard");
    discard.shuffle();
    print("deck = discard");
    deck = discard;
    print("add latest 5+newyear to deck");
    deck.addAll(afterNewYear);
    print("clear discard");
    discard = [];

    await Future.delayed(Duration(seconds: 4));
    GameCard card = deck[0];
    deck.removeAt(0);
    discard.add(card);
    update(card);
    setLoading(false);
  }
}
