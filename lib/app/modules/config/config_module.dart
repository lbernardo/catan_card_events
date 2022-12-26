import 'package:eventos_catan/app/modules/config/config_page.dart';
import 'package:eventos_catan/app/modules/config/config_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConfigModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ConfigPage()),
  ];
}
