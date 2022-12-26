import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class EndGamePage extends StatefulWidget {
  final String title;
  const EndGamePage({Key? key, this.title = 'EndGamePage'}) : super(key: key);
  @override
  EndGamePageState createState() => EndGamePageState();
}

class EndGamePageState extends State<EndGamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Text(
                "Fim do Jogo",
                style: GoogleFonts.pacifico(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "O fim do jogo chegou! Aquele que tiver mais pontos de vitória é o campeão de catan!",
                  style: GoogleFonts.pacifico(fontSize: 15),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Modular.to.pushNamed("/config");
                  },
                  child: Text("Novo jogo"))
            ],
          ),
        ),
      ),
    );
  }
}
