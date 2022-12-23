import 'package:eventos_catan/app/modules/game/game_page.dart';
import 'package:eventos_catan/app/modules/game/game_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GameModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => GameStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => GamePage()),
  ];
}
