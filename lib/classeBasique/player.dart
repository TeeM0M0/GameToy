class Player {
  //attribut
  String _nom = "";
  int _nbVictoire = 0;
  int _nbCoup = 0;

  //constructeur
  Player(this._nom);

  //getter & setter

  String getNom() {
    return _nom;
  }

  void setNom(String nomJoueur) {
    _nom = nomJoueur;
  }

  int getNbVictoire() {
    return _nbVictoire;
  }

  void setNbVictoire(int nombreV) {
    _nbVictoire = nombreV;
  }

  int getNbCoup() {
    return _nbCoup;
  }

  void setNbCoup(int nombreC) {
    _nbCoup = nombreC;
  }

  void addVictoire() {
    this._nbVictoire++;
  }
}
