import 'package:eventos_catan/app/modules/config/config_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eventos_catan/app/modules/players/players_store.dart';
import 'package:flutter/material.dart';
import 'package:sortable_list/sortable_list.dart';

class PlayersPage extends StatefulWidget {
  final String title;
  const PlayersPage({Key? key, this.title = 'Configuração dos jogadores'})
      : super(key: key);
  @override
  PlayersPageState createState() => PlayersPageState();
}

class PlayersPageState extends State<PlayersPage> {
  final PlayersStore store = Modular.get();
  final ConfigStore configStore = Modular.get();

  List<Color> _players = [];

  @override
  void initState() {
    super.initState();
    _players = configStore.state.players;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () {
            configStore.setPlayers(_players);
            Modular.to.navigate("/game");
          },
        ),
        body: SortableList<Color>(
          items: _players,
          itemExtent: 72.0,
          itemBuilder: (context, item, handle) => Container(
            height: 72.0,
            color: item.value,
            child: Row(children: [
              Spacer(),
              Text("${item.itemIndex! + 1}º Jogador"),
              Spacer(),
              handle,
            ]),
          ),
        ));
  }
}
