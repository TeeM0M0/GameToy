import 'package:flutter/material.dart';
import 'Morpion/morpion_game.dart';

class Morpion extends StatefulWidget {
  const Morpion({super.key});

  @override
  _Morpion createState() => _Morpion();
}

class _Morpion extends State<Morpion> {
  MorpionG jeu = MorpionG();
  List plateauInitial = [];
  int tour = 0;
  int victoireJ1 = 0;
  int victoireJ2 = 0;

  void _init() {
    plateauInitial = jeu.getPlateau().getPlateau();
    victoireJ1 = jeu.getJoueur1().getNbVictoire();
    victoireJ2 = jeu.getJoueur2().getNbVictoire();
    tour = jeu.getTour();
  }

  void _onClique(int index) {
    if (tour % 2 == 0) {
      setState(() {
        if (plateauInitial[index] == '') {
          plateauInitial[index] = 'O';
          jeu.addTour();
          jeu.ifWin();
        }
      });
    } else {
      setState(() {
        if (plateauInitial[index] == '') {
          plateauInitial[index] = 'X';
          jeu.addTour();
          jeu.ifWin();
        }
      });
    }
  }

  Widget affichageTourJoueur() {
    Widget affichage;
    if (tour % 2 == 0) {
      affichage = Center(
        child: Text("Au tour du Joueur 2", style: TextStyle()),
      );
    } else {
      affichage = Center(
        child: Text("Au tour du Joueur 1", style: TextStyle()),
      );
    }
    return affichage;
  }

  void resetPlateau() {
    setState(() {
      jeu.resetPlateau();
      tour = 1;
    });
  }

  void resetJeu() {
    setState(() {
      jeu.resetJeu();
      tour = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    _init();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Morpion'),
        backgroundColor: const Color.fromRGBO(194, 195, 197, 5),
      ),
      body: ListView(
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(20)),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  _onClique(index);
                },
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Center(
                    child: Text(
                      plateauInitial[index],
                      style: const TextStyle(color: Colors.black, fontSize: 35),
                    ),
                  ),
                ),
              );
            },
          ),
          const Padding(padding: EdgeInsets.all(10)),
          affichageTourJoueur(),
          const Padding(padding: EdgeInsets.all(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Victoire du joueur 1"),
                  Text(victoireJ1.toString())
                ],
              ),
              Column(
                children: <Widget>[
                  Text("Victoire du joueur 2"),
                  Text(victoireJ2.toString())
                ],
              )
            ],
          ),
          const Padding(padding: EdgeInsets.all(20)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
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
                  ],
                ),
                Column(
                  children: <Widget>[
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
