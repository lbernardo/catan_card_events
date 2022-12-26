import 'package:eventos_catan/app/models/event.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eventos_catan/app/modules/dice/dice_store.dart';
import 'package:flutter/material.dart';

class DicePage extends StatefulWidget {
  final String title;
  const DicePage({Key? key, this.title = 'DicePage'}) : super(key: key);
  @override
  DicePageState createState() => DicePageState();
}

class DicePageState extends State<DicePage> {
  final DiceStore store = Modular.get();

  Event event = createDeck()[4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          event.title,
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 255, 234, 234),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Image.asset(
              event.imageUrl,
              width: 300,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: event.actions
                      .map<Widget>((e) => Text(
                            e,
                            style: TextStyle(fontSize: 20),
                          ))
                      .toList()),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(100.0),
              child: Center(
                  child: Text(
                '${event.value}',
                style: TextStyle(color: Colors.white, fontSize: 40),
              )),
              decoration:
                  BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
            ),
          ],
        ),
      ),
    );
  }
}
