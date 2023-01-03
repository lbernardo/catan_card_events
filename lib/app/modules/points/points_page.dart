import 'package:eventos_catan/app/modules/config/config_store.dart';
import 'package:eventos_catan/app/modules/points/blue_points.dart_store.dart';
import 'package:eventos_catan/app/modules/points/orange_points.dart_store.dart';
import 'package:eventos_catan/app/modules/points/points.dart';
import 'package:eventos_catan/app/modules/points/red_points.dart_store.dart';
import 'package:eventos_catan/app/modules/points/white_points.dart_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class PointsPage extends StatefulWidget {
  final String title;
  const PointsPage({Key? key, this.title = 'Contagem de pontos'})
      : super(key: key);
  @override
  PointsPageState createState() => PointsPageState();
}

Widget counter({required Points store, value = 0, color = Colors.orange}) {
  return GestureDetector(
    onTap: () => store.addPoint(),
    onLongPress: () => store.removePoint(),
    child: Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.only(top: 50),
      child: Center(
          child: Text(
        '${value}',
        style: TextStyle(color: Colors.black, fontSize: 40),
      )),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    ),
  );
}

class Counter {
  Color color;
  Points store;

  Counter({required this.color, required this.store});
}

class PointsPageState extends State<PointsPage> {
  final BluePointsStore bluePoints = Modular.get();
  final RedPointsStore redPoints = Modular.get();
  final OrangePointsStore orangePoints = Modular.get();
  final WhitePointsStore whitePoints = Modular.get();
  final ConfigStore configStore = Modular.get();

  List<Counter> _players = [];

  @override
  void initState() {
    super.initState();
    if (configStore.state.players.contains(Colors.blueAccent)) {
      _players.add(Counter(color: Colors.blueAccent, store: bluePoints));
    }
    if (configStore.state.players.contains(Colors.redAccent)) {
      _players.add(Counter(color: Colors.redAccent, store: redPoints));
    }
    if (configStore.state.players.contains(Colors.orangeAccent)) {
      _players.add(Counter(color: Colors.orangeAccent, store: orangePoints));
    }
    if (configStore.state.players.contains(Colors.white70)) {
      _players.add(Counter(color: Colors.white70, store: whitePoints));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: _players.length,
          itemBuilder: (context, index) => ScopedBuilder(
            store: _players[index].store,
            onState: (context, state) => counter(
                store: _players[index].store,
                color: _players[index].color,
                value: '${state}'),
          ),
        ),
      ),
    );
  }
}
