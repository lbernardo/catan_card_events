import 'package:eventos_catan/app/widget/dialog.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eventos_catan/app/modules/game/game_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:eventos_catan/app/models/card.dart';

class GamePage extends StatefulWidget {
  final String title;
  const GamePage({Key? key, this.title = 'GamePage'}) : super(key: key);
  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  final GameStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogo iniciado"),
        actions: [
          IconButton(
              onPressed: () => {
                    confirmDialog(context,
                        title: "Reiniciar jogo",
                        content:
                            "Você tem certeza que deseja reiniciar o jogo?",
                        onPress: () {
                      Navigator.pop(context);
                      store.clearDeck();
                    })
                  },
              icon: Icon(Icons.clear_all_outlined))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              ScopedBuilder(
                store: store,
                onLoading: (context) => CircularProgressIndicator(),
                onState: (context, GameCard card) => GestureDetector(
                  onDoubleTap: () => store.nextCard(),
                  child: Image.asset(
                    card.imageName,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {store.nextCard()},
        child: Icon(Icons.refresh),
      ),
    );
  }
}
