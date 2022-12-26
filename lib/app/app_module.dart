import 'package:eventos_catan/app/modules/config/config_module.dart';
import 'package:eventos_catan/app/modules/config/config_store.dart';
import 'package:eventos_catan/app/modules/dice/dice_module.dart';
import 'package:eventos_catan/app/modules/game/game_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/game/dice_store.dart';
import 'modules/game/eras_store.dart';
import 'modules/game/game_store.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ConfigStore()),
    Bind.lazySingleton((i) => GameStore()),
    Bind.lazySingleton((i) => DiceStore()),
    Bind.lazySingleton((i) => ErasStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/config',
        module: ConfigModule(), transition: TransitionType.leftToRight),
    ModuleRoute('/game',
        module: GameModule(), transition: TransitionType.rightToLeft),
    ModuleRoute('/dice', module: DiceModule()),
  ];
}
