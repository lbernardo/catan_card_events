import 'package:eventos_catan/app/modules/points/white_points.dart_store.dart';
import 'package:eventos_catan/app/modules/points/red_points.dart_store.dart';
import 'package:eventos_catan/app/modules/points/orange_points.dart_store.dart';
import 'package:eventos_catan/app/modules/points/blue_points.dart_store.dart';
import 'package:eventos_catan/app/modules/points/points_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PointsModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => PointsPage()),
  ];
}
