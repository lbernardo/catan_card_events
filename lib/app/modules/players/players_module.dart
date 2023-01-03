import 'package:eventos_catan/app/modules/players/players_page.dart';
import 'package:eventos_catan/app/modules/players/players_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PlayersModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PlayersStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => PlayersPage()),
  ];
}
