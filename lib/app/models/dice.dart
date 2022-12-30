class Dice {
  String image;
  bool disabled;
  Dice(this.image, {this.disabled = false});
}

Dice getDiceEvent() {
  List<Dice> diceEvents = [
    Dice("assets/dice/blue_dice.png"),
    Dice("assets/dice/green_dice.png"),
    Dice("assets/dice/yellow_dice.png"),
    Dice("assets/dice/ship.png"),
    Dice("assets/dice/ship.png"),
    Dice("assets/dice/ship.png"),
  ];
  diceEvents.shuffle();
  diceEvents.shuffle();
  diceEvents.shuffle();
  Dice diceSelected = diceEvents.first;
  return diceSelected;
}
