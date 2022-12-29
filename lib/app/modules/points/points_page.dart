import 'package:eventos_catan/app/modules/points/blue_points.dart_store.dart';
import 'package:eventos_catan/app/modules/points/orange_points.dart_store.dart';
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

Widget counter(
    {required void Function()? onTab, value = 0, color = Colors.orange}) {
  return GestureDetector(
    onTap: onTab,
    child: Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.only(top: 50),
      child: Center(
          child: Text(
        '${value}',
        style: TextStyle(color: Colors.white, fontSize: 40),
      )),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    ),
  );
}

class PointsPageState extends State<PointsPage> {
  final BluePointsStore bluePoints = Modular.get();
  final RedPointsStore redPoints = Modular.get();
  final OrangePointsStore orangePoints = Modular.get();
  final WhitePointsStore whitePoints = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ScopedBuilder(
                  store: orangePoints,
                  onState: (context, state) => counter(
                      onTab: () {
                        orangePoints.addPoint();
                      },
                      color: Colors.orange,
                      value: '${state}'),
                ),
                ScopedBuilder(
                  store: bluePoints,
                  onState: (context, state) => counter(
                      onTab: () {
                        bluePoints.addPoint();
                      },
                      color: Colors.blue,
                      value: '${state}'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ScopedBuilder(
                  store: redPoints,
                  onState: (context, state) => counter(
                      onTab: () {
                        redPoints.addPoint();
                      },
                      color: Colors.red,
                      value: '${state}'),
                ),
                ScopedBuilder(
                  store: whitePoints,
                  onState: (context, state) => counter(
                      onTab: () {
                        whitePoints.addPoint();
                      },
                      color: Colors.grey,
                      value: '${state}'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
