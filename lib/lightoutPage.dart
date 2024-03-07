import 'package:flutter/material.dart';
import 'lightout/lightout_game.dart';

class Lightout extends StatefulWidget {
  const Lightout({super.key});

  @override
  _Lightout createState() => _Lightout();
}

class _Lightout extends State<Lightout> {
  LightOutG jeu = LightOutG();
  List plateauInitial = [];
  int coup = 0;
  int victoireJ1 = 0;
  bool estLance = false;

  void _init() {
    plateauInitial = jeu.getPlateau().getPlateau();
    victoireJ1 = jeu.getJoueur1().getNbVictoire();
    coup = jeu.getCoup();
  }

  void _onTap(int index) {
    setState(() {
      jeu.change(index);
      jeu.ifWinf();
    });
  }

  Widget affichageInformation() {
    Widget affichage = Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nombre de coup effectués : " + coup.toString()),
          ],
        ),
        const Padding(padding: EdgeInsets.all(5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Nombre de victoire : " + victoireJ1.toString())],
        )
      ],
    );
    return affichage;
  }

  void resetPlateau() {
    setState(() {
      jeu.resetPlateau();
      jeu.resetCoup();
      estLance = false;
    });
  }

  void resetJeu() {
    setState(() {
      jeu.resetJeu();
      estLance = false;
    });
  }

  Widget cellule(int index) {
    if (plateauInitial[index] == true) {
      return Text("*");
    } else {
      return Text("");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (estLance == false) {
      jeu.initTableau();
      estLance = !estLance;
    }
    _init();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Light Out'),
        backgroundColor: const Color.fromRGBO(194, 195, 197, 5),
      ),
      body: ListView(
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(20)),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 25,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  _onTap(index);
                },
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Center(
                    child: cellule(index),
                  ),
                ),
              );
            },
          ),
          const Padding(padding: EdgeInsets.all(10)),
          affichageInformation(),
          const Padding(padding: EdgeInsets.all(10)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Padding(padding: EdgeInsets.all(10)),
                    ElevatedButton(
                      onPressed: () {
                        resetPlateau();
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 1, color: Colors.black),
                        backgroundColor: const Color.fromRGBO(194, 195, 197, 5),
                      ),
                      child: const Text(
                        "Réinitialiser le plateau",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    ElevatedButton(
                      onPressed: () {
                        resetJeu();
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 1, color: Colors.black),
                        backgroundColor: const Color.fromRGBO(194, 195, 197, 5),
                      ),
                      child: const Text(
                        "Réinitialiser le jeu",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
