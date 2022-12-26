import 'package:flutter_test/flutter_test.dart';
import 'package:eventos_catan/app/modules/config/config_store.dart';
 
void main() {
  late ConfigStore store;

  setUpAll(() {
    store = ConfigStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}