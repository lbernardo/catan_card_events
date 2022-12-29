import 'package:eventos_catan/app/modules/config/config_module.dart';
import 'package:eventos_catan/app/modules/config/config_store.dart';
import 'package:eventos_catan/app/modules/game/game_module.dart';
import 'package:eventos_catan/app/modules/points/blue_points.dart_store.dart';
import 'package:eventos_catan/app/modules/points/orange_points.dart_store.dart';
import 'package:eventos_catan/app/modules/points/points_module.dart';
import 'package:eventos_catan/app/modules/points/red_points.dart_store.dart';
import 'package:eventos_catan/app/modules/points/white_points.dart_store.dart';
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
    Bind.singleton((i) => WhitePointsStore()),
    Bind.singleton((i) => RedPointsStore()),
    Bind.singleton((i) => OrangePointsStore()),
    Bind.singleton((i) => BluePointsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/config',
        module: ConfigModule(), transition: TransitionType.rightToLeft),
    ModuleRoute('/game',
        module: GameModule(), transition: TransitionType.rightToLeft),
    ModuleRoute('/points',
        module: PointsModule(), transition: TransitionType.rightToLeft),
  ];
}
