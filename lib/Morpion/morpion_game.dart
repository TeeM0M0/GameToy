import 'package:gametoyfinal/classeBasique/plateau.dart';
import 'package:gametoyfinal/classeBasique/player.dart';

class MorpionG {
  Plateau _plateau = Plateau(9, "");
  Player _joueur1 = Player('joueur1');
  Player _joueur2 = Player('joueur2');
  int _tour = 1;

  MorpionG();

  //getter & setter

  Player getJoueur1() {
    return _joueur1;
  }

  Player getJoueur2() {
    return _joueur2;
  }

  Plateau getPlateau() {
    return this._plateau;
  }

  int getTour() {
    return this._tour;
  }

  void addTour() {
    this._tour++;
  }

  void resetTour() {
    this._tour = 1;
  }

  void resetPlateau() {
    this._plateau = Plateau(9, "");
    resetTour();
  }

  void resetJeu() {
    this._plateau = Plateau(9, "");
    this._joueur1 = Player('joueur1');
    this._joueur2 = Player('joueur2');
  }

  bool estRemplis() {
    List plateau = _plateau.getPlateau();
    return plateau.every((element) => element != "");
  }

  void ifWin() {
    List plateau = this._plateau.getPlateau();
    List<List<int>> combinaisonsGagnantes = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Lignes horizontales
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Colonnes verticales
      [0, 4, 8], [2, 4, 6] // Diagonales
    ];

    // Parcourir toutes les combinaisons gagnantes pour vérifier si l'une d'elles est remplie par un joueur.
    for (var combinaison in combinaisonsGagnantes) {
      var premierIndice = combinaison[0];
      var deuxiemeIndice = combinaison[1];
      var troisiemeIndice = combinaison[2];

      var symbolePremier = plateau[premierIndice];
      var symboleDeuxieme = plateau[deuxiemeIndice];
      var symboleTroisieme = plateau[troisiemeIndice];

      if (symbolePremier != '' &&
          symbolePremier == symboleDeuxieme &&
          symbolePremier == symboleTroisieme) {
        if (symbolePremier == "X") {
          _joueur1.addVictoire();
          resetPlateau();
        } else {
          _joueur2.addVictoire();
          resetPlateau();
        }
      }
    }
  }
}
