import 'package:flutter_test/flutter_test.dart';
import 'package:eventos_catan/app/modules/points/green_points_store.dart_store.dart';
 
void main() {
  late GreenPointsStoreDartStore store;

  setUpAll(() {
    store = GreenPointsStoreDartStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}