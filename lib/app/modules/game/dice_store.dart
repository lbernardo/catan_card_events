import 'package:eventos_catan/app/models/dice.dart';
import 'package:flutter_triple/flutter_triple.dart';

class DiceStore extends NotifierStore<Exception, Dice> {
  DiceStore() : super(Dice("", disabled: true));

  List<Dice> dice = [
    Dice("assets/dice/blue_dice.png"),
    Dice("assets/dice/green_dice.png"),
    Dice("assets/dice/yellow_dice.png"),
    Dice("assets/dice/ship.png"),
    Dice("assets/dice/ship.png"),
    Dice("assets/dice/ship.png"),
  ];

  getFace() async {
    dice.shuffle();
    dice.shuffle();
    dice.shuffle();
    Dice diceSelected = dice.first;
    update(diceSelected);
  }
}
