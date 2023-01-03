import 'package:flutter_test/flutter_test.dart';
import 'package:eventos_catan/app/modules/player/player_store.dart';
 
void main() {
  late PlayerStore store;

  setUpAll(() {
    store = PlayerStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}