import 'package:flutter_test/flutter_test.dart';
import 'package:eventos_catan/app/modules/points/white_points.dart_store.dart';
 
void main() {
  late WhitePointsDartStore store;

  setUpAll(() {
    store = WhitePointsDartStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}