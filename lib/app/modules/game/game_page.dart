import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:eventos_catan/app/models/config.dart';
import 'package:eventos_catan/app/models/dice.dart';
import 'package:eventos_catan/app/modules/config/config_store.dart';
import 'package:eventos_catan/app/widget/dialog.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eventos_catan/app/modules/game/game_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:eventos_catan/app/models/card.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dice_store.dart';
import 'eras_store.dart';

class GamePage extends StatefulWidget {
  final String title;
  const GamePage({Key? key, this.title = 'GamePage'}) : super(key: key);
  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  final GameStore store = Modular.get();
  final DiceStore diceStore = Modular.get();
  final ErasStore erasStore = Modular.get();
  final ConfigStore configStore = Modular.get();
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.open(
      Audio("assets/audio/dice-rolling.mp3"),
    );
  }

  void play() {
    assetsAudioPlayer.playOrPause();
  }

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
      body: Column(
        children: [
          ScopedBuilder(
            store: erasStore,
            onState: (context, state) => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "${state}º era",
                style: GoogleFonts.pacifico(
                    fontSize: 20,
                    color: state == configStore.state.eras
                        ? Colors.redAccent
                        : Colors.black),
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: <Widget>[
                      ScopedBuilder(
                        store: store,
                        onLoading: (context) => CircularProgressIndicator(),
                        onState: (context, GameCard card) => GestureDetector(
                          onDoubleTap: () {
                            play();
                            store.nextCard();
                            diceStore.getFace();
                          },
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
              Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 10),
                  child: ScopedBuilder(
                    store: diceStore,
                    onState: (context, Dice state) => state.disabled
                        ? Container()
                        : Image.asset(
                            state.image,
                            width: 50,
                            height: 50,
                          ),
                  )),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          play();
          store.nextCard();
          diceStore.getFace();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
