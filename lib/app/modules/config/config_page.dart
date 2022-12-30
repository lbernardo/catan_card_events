import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:eventos_catan/app/models/config.dart';
import 'package:eventos_catan/app/modules/game/eras_store.dart';
import 'package:eventos_catan/app/modules/game/game_store.dart';
import 'package:eventos_catan/app/modules/points/blue_points.dart_store.dart';
import 'package:eventos_catan/app/modules/points/orange_points.dart_store.dart';
import 'package:eventos_catan/app/modules/points/red_points.dart_store.dart';
import 'package:eventos_catan/app/modules/points/white_points.dart_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eventos_catan/app/modules/config/config_store.dart';
import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  final String title;
  const ConfigPage({Key? key, this.title = 'Configurações'}) : super(key: key);
  @override
  ConfigPageState createState() => ConfigPageState();
}

class ConfigPageState extends State<ConfigPage> {
  final ConfigStore store = Modular.get();
  final ErasStore erasStore = Modular.get();
  final GameStore gameStore = Modular.get();
  final BluePointsStore bluePoints = Modular.get();
  final RedPointsStore redPoints = Modular.get();
  final OrangePointsStore orangePoints = Modular.get();
  final WhitePointsStore whitePoints = Modular.get();
  String? withEras;
  int eras = 3;
  final TextStyle styleTextDefault =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 15);

  DirectSelectItem<int> getDropDownMenuItem(int value) {
    return DirectSelectItem<int>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text('${value} eras');
        });
  }

  BoxDecoration _getShadowDecoration() {
    return BoxDecoration(
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black.withOpacity(0.06),
          spreadRadius: 4,
          offset: new Offset(0.0, 0.0),
          blurRadius: 15.0,
        ),
      ],
    );
  }

  _getDslDecoration() {
    return BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.black12),
        top: BorderSide(width: 1, color: Colors.black12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: DirectSelectContainer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Você deseja jogar com limite de eras?",
                style: styleTextDefault,
              ),
              RadioListTile(
                title: Text("Sim"),
                value: "yes",
                groupValue: withEras,
                onChanged: (value) {
                  setState(() {
                    withEras = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text("Não"),
                value: "no",
                groupValue: withEras,
                onChanged: (value) {
                  setState(() {
                    withEras = value.toString();
                  });
                },
              ),
              (withEras == "no" || withEras == null)
                  ? Container()
                  : Column(
                      children: [
                        Text(
                          "Quantas eras você deseja jogar?",
                          style: styleTextDefault,
                        ),
                      ],
                    ),
              (withEras == null || withEras == "no")
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: _getShadowDecoration(),
                            child: DirectSelectList<int>(
                                values: [for (var i = 3; i <= 15; i += 1) i],
                                defaultItemIndex: 0,
                                itemBuilder: (int value) =>
                                    getDropDownMenuItem(value),
                                focusedItemDecoration: _getDslDecoration(),
                                onItemSelectedListener: (item, index, context) {
                                  eras = item;
                                }),
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("${withEras} and ${eras}");
          store.setConfig(withEras == "yes", eras);
          erasStore.clearEra();
          gameStore.clearDeck();
          bluePoints.clearPoints();
          redPoints.clearPoints();
          whitePoints.clearPoints();
          orangePoints.clearPoints();
          Modular.to.navigate("/game");
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
