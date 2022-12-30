import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eventos_catan/app/models/event.dart';
import 'package:eventos_catan/app/modules/config/config_store.dart';
import 'package:eventos_catan/app/modules/game/title_store.dart';
import 'package:eventos_catan/app/widget/dialog.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eventos_catan/app/modules/game/game_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import 'eras_store.dart';

class GamePage extends StatefulWidget {
  final String title;
  const GamePage({Key? key, this.title = 'GamePage'}) : super(key: key);
  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  final GameStore store = Modular.get();
  final ErasStore erasStore = Modular.get();
  final ConfigStore configStore = Modular.get();
  final assetsAudioPlayer = AssetsAudioPlayer();
  final TitleStore titleStore = Modular.get();
  bool audioLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  void play() async {
    if (!audioLoaded) {
      audioLoaded = true;
      await assetsAudioPlayer.open(
        Audio("assets/audio/dice-rolling.mp3"),
      );
    }
    assetsAudioPlayer.play();
  }

  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ScopedBuilder(
          store: titleStore,
          onState: (context, String title) => Text(title),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Modular.to.pushNamed("/points");
              },
              icon: Icon(FontAwesome5.coins)),
          IconButton(
              onPressed: () => {
                    confirmDialog(context,
                        title: "Reiniciar jogo",
                        content:
                            "Você tem certeza que deseja reiniciar o jogo?",
                        onPress: () {
                      Navigator.pop(context);
                      Modular.to.navigate("/config");
                    })
                  },
              icon: Icon(Icons.clear_all_outlined)),
        ],
      ),
      body: ScopedBuilder(
          store: store,
          onLoading: (context) => CircularProgressIndicator(),
          onState: (context, List<Event> events) => Container(
                color: Color.fromARGB(255, 255, 234, 234),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
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
                    SizedBox(
                      height: 30,
                    ),
                    CarouselSlider(
                      items: events
                          .map<Widget>((event) => Column(
                                children: [
                                  Image.asset(
                                    event.imageUrl,
                                    width: 300,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0,
                                        right: 8,
                                        top: 15,
                                        bottom: 0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: event.actions
                                            .map<Widget>((e) => Text(
                                                  e,
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ))
                                            .toList()),
                                  ),
                                  event.newYear
                                      ? CircularProgressIndicator()
                                      : Container(
                                          width: 100,
                                          height: 100,
                                          margin: EdgeInsets.only(top: 50),
                                          child: Center(
                                              child: Text(
                                            event.value == 0
                                                ? '-'
                                                : '${event.value}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 40),
                                          )),
                                          decoration: BoxDecoration(
                                              color: Colors.orange,
                                              shape: BoxShape.circle),
                                        ),
                                  event.newYear
                                      ? Container()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Image.asset(
                                              event.diceEvent.image,
                                              width: 50,
                                              height: 50,
                                            ),
                                            Image.asset(
                                              "assets/dice/${event.dice}.png",
                                              width: 50,
                                              height: 50,
                                            )
                                          ],
                                        )
                                ],
                              ))
                          .toList(),
                      carouselController: controller,
                      options: CarouselOptions(
                          height: 600,
                          enableInfiniteScroll: false,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) async {
                            titleStore.updateTitle(events[index].title);
                            if (events[index].newYear) {
                              print("Ano novo");
                              await Future.delayed(Duration(seconds: 2));
                              store.itsNewYear();
                              controller.jumpToPage(0);
                            }
                          }),
                    )
                  ],
                ),
              )),
    );
  }
}
