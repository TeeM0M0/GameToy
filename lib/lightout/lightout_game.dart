import 'dart:math';

import 'package:gametoyfinal/classeBasique/plateau.dart';
import 'package:gametoyfinal/classeBasique/player.dart';

class LightOutG {
  Plateau _plateau = Plateau(25, false);
  Player _joueur1 = Player('joueur1');
  int _coup = 0;

  LightOutG();

  //getter & setter

  Player getJoueur1() {
    return _joueur1;
  }

  Plateau getPlateau() {
    return this._plateau;
  }

  int getCoup() {
    return this._coup;
  }

  void addCoup() {
    this._coup++;
  }

  void resetCoup() {
    this._coup = 0;
  }

  void resetPlateau() {
    this._plateau = Plateau(25, false);
    resetCoup();
  }

  void resetJeu() {
    this._plateau = Plateau(25, false);
    this._joueur1 = Player('joueur1');
    resetCoup();
  }

  void ifWinf() {
    List plateau = _plateau.getPlateau();
    if (plateau.every((element) => element == false)) {
      _joueur1.addVictoire();
      resetPlateau();
      initTableau();
    }
  }

  void initTableau() {
    for (var i = 0; i < 5; i++) {
      Random random = Random();
      int nbA = random.nextInt(25);
      change(nbA);
      resetCoup();
    }
  }

  void change(int index) {
    if (index % 5 == 0) {
      _plateau.setPlateauIndex(index, !_plateau.getPlateauIndex(index));
      _plateau.setPlateauIndex(index + 1, !_plateau.getPlateauIndex(index + 1));
      if (index == 0) {
        _plateau.setPlateauIndex(
            index + 5, !_plateau.getPlateauIndex(index + 5));
      } else if (index == 20) {
        _plateau.setPlateauIndex(
            index - 5, !_plateau.getPlateauIndex(index - 5));
      } else {
        _plateau.setPlateauIndex(
            index + 5, !_plateau.getPlateauIndex(index + 5));
        _plateau.setPlateauIndex(
            index - 5, !_plateau.getPlateauIndex(index - 5));
      }
    } else if (index % 5 == 4) {
      _plateau.setPlateauIndex(index, !_plateau.getPlateauIndex(index));
      _plateau.setPlateauIndex(index - 1, !_plateau.getPlateauIndex(index - 1));
      if (index == 4) {
        _plateau.setPlateauIndex(
            index + 5, !_plateau.getPlateauIndex(index + 5));
      } else if (index == 24) {
        _plateau.setPlateauIndex(
            index - 5, !_plateau.getPlateauIndex(index - 5));
      } else {
        _plateau.setPlateauIndex(
            index + 5, !_plateau.getPlateauIndex(index + 5));
        _plateau.setPlateauIndex(
            index - 5, !_plateau.getPlateauIndex(index - 5));
      }
    } else if (index >= 1 && index <= 3) {
      _plateau.setPlateauIndex(index, !_plateau.getPlateauIndex(index));
      _plateau.setPlateauIndex(index - 1, !_plateau.getPlateauIndex(index - 1));
      _plateau.setPlateauIndex(index + 1, !_plateau.getPlateauIndex(index + 1));
      _plateau.setPlateauIndex(index + 5, !_plateau.getPlateauIndex(index + 5));
    } else if (index >= 21 && index <= 23) {
      _plateau.setPlateauIndex(index, !_plateau.getPlateauIndex(index));
      _plateau.setPlateauIndex(index - 1, !_plateau.getPlateauIndex(index - 1));
      _plateau.setPlateauIndex(index + 1, !_plateau.getPlateauIndex(index + 1));
      _plateau.setPlateauIndex(index - 5, !_plateau.getPlateauIndex(index - 5));
    } else {
      _plateau.setPlateauIndex(index, !_plateau.getPlateauIndex(index));
      _plateau.setPlateauIndex(index - 1, !_plateau.getPlateauIndex(index - 1));
      _plateau.setPlateauIndex(index + 1, !_plateau.getPlateauIndex(index + 1));
      _plateau.setPlateauIndex(index - 5, !_plateau.getPlateauIndex(index - 5));
      _plateau.setPlateauIndex(index + 5, !_plateau.getPlateauIndex(index + 5));
    }
    addCoup();
  }
}
