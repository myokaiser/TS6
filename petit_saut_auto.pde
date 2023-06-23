//___________________________________________\ class du super saut /___________________________________________\\

class PetitSaut {
  int x;
  int y;
  String objId;
  int i;

  int taillePS = 40;

  boolean valeurI ;
  color couleur;

  //___________________________________________\ controleur instance superSaut /___________________________________________\\

  PetitSaut (String nouvbjId, int nouvX, int nouvY) {
    objId = nouvbjId;
    x = nouvX;
    y = nouvY;
  }

  void displayPS () {
//    stroke (250);
//    ellipse (x, y, 20, 20);
    PSBouge();
    activationPS();
    activationSautN();
    activationSautInverse();
    condition(); 
    animationsaut();   
  }

  //___________________________________________\ mouvement petit saut /___________________________________________\\

  void PSBouge () {    
    x -=  vitesse;  
    if ( ( monPerso.y < hauteur )
      &&   ( monPerso.affichageVaisseau == false ) )
    {
      y+= Vcadrage;
    }
    if ( ( monPerso.y > base )
      &&   ( monPerso.affichageVaisseau == false ) )
    {
      y-= Vcadrage;
    }
  }

  //___________________________________________\ activation du petit saut /___________________________________________\\

  void activationPS () {
    if (( (monPerso.x+50 ) >= ( x-taillePS )) 
      && (( monPerso.x+50  )  <= ( x+taillePS )) 
      && (( monPerso.y+50  )  >= ( y-20 ))
      && (( monPerso.y+50  )  <= ( y+20 ))
      && (objId == "petitsaut"))
    {
      monPerso.petitsaut = true;
      // monPerso.forceY = 2;
      monPerso.debutsaute();
    }
  }

  void activationSautN () {
    if (( (monPerso.x+50 ) >= ( x-taillePS )) 
      && (( monPerso.x+50  )  <= ( x+taillePS )) 
      && (( monPerso.y+50  )  >= ( y-20 ))
      && (( monPerso.y+50  )  <= ( y+20 ))
      && (objId == "sautnormal"))
    {
      monPerso.debutsaute();
    }
  }

  void activationSautInverse () {
    if (( (monPerso.x+50 ) >= ( x-taillePS )) 
      && (( monPerso.x+50  )  <= ( x+taillePS )) 
      && (( monPerso.y+50  )  >= ( y-20 ))
      && (( monPerso.y+50  )  <= ( y+20 ))
      && (objId == "inverse"))
    {
      monPerso.graviteOn(); // detruit la gravité
      monPerso.sensGravite = false;
    }
  }

  //___________________________________________\ animation couleur saut /___________________________________________\\

  void animationsaut() {

    fill(couleur);
    strokeWeight(4.5);
    noStroke();
    arc(x, y, 50, 20, -PI, 0); // -PI, 0 ou PI, 2*PI les deux fonctionnent, 
    bouge(); //création d'un arc de ciel pour modéliser la présence d'un saut automatique
    if (objId == "petitsaut") { //affectation de couleur différente selon le type de portail (id)
      couleur = color(0, 255-i, 255-i);
    }
    if (objId == "sautnormal") {
      couleur = color(255-i, 0, 255-i);// le i va sans cesse augmenter
    }                                  // puis diminuer avec le jeu de boolean qui se répond
    if (objId == "inverse") {
      couleur = color(255-i, 255-i, 0);
    }
  }

  void bouge() { // fonction permettant d'animer les sauts automatiques
    if (valeurI == true) { //boolean activé si i == 0
      i+=6; // l'augmentation de i va faire diminuer la couleur du saut automatique
    }
    if (valeurI == false) { //boolean activé si i == 258
      i-=6; // la diminution de i va faire augmenter la couleur du saut automatique
    }
  }

  void condition() { // fonction boolean pour que le i varie en permanence 
    if (i == 258) {
      valeurI = false;
    }
    if (i == 0) {
      valeurI = true;
    }
  }
  
  boolean mort() {
    if ( x+50 < 0) {
      return true;
    } else {
      return false;
    }
  }
}
