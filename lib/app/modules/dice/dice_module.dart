import 'package:eventos_catan/app/modules/dice/dice_page.dart';
import 'package:eventos_catan/app/modules/dice/dice_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DiceModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DiceStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => DicePage()),
  ];
}
