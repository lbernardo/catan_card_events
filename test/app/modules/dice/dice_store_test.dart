import 'package:flutter_test/flutter_test.dart';
import 'package:eventos_catan/app/modules/dice/dice_store.dart';
 
void main() {
  late DiceStore store;

  setUpAll(() {
    store = DiceStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}