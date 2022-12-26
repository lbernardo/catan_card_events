import 'package:eventos_catan/app/modules/game/dice_store.dart';
import 'package:eventos_catan/app/modules/game/end_game_page.dart';
import 'package:eventos_catan/app/modules/game/eras_store.dart';
import 'package:eventos_catan/app/modules/game/game_page.dart';
import 'package:eventos_catan/app/modules/game/game_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GameModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => GamePage()),
    ChildRoute('/end_game', child: (_, args) => EndGamePage())
  ];
}
