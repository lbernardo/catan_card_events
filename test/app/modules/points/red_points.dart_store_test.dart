import 'package:flutter_test/flutter_test.dart';
import 'package:eventos_catan/app/modules/points/red_points.dart_store.dart';
 
void main() {
  late RedPointsDartStore store;

  setUpAll(() {
    store = RedPointsDartStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}