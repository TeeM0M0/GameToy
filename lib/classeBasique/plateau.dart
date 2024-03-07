class Plateau {
  //attribut
  List _plateau = [];
  int _taille;

  //contructeur

  Plateau(this._taille, cellule) {
    for (var i = 0; i < _taille; i++) {
      _plateau.add(cellule);
    }
  }
  //getter & setter
  List getPlateau() {
    return _plateau;
  }

  void setPlateau(List plateau) {
    this._plateau = plateau;
  }

  int getTaille() {
    return _taille;
  }

  void setPlateauIndex(int index, donnee) {
    _plateau[index] = donnee;
  }

  getPlateauIndex(int index) {
    return _plateau[index];
  }
}
