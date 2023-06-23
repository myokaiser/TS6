int tailleES = 50; // taille de l'image de l'étoile //

class etoile {
  int x, y;
  PShape etoile ;

  etoile ( int NouvX, int NouvY) {
    x = NouvX;
    y = NouvY;

    etoile = createShape();
    etoile.beginShape();
    etoile.fill(#EDFF03);
    etoile.noStroke();
    etoile.vertex(0, -50);
    etoile.vertex(+14, -20);
    etoile.vertex(+47, -15);
    etoile.vertex(+23, +7);
    etoile.vertex(+29, +40);
    etoile.vertex(+0, +25);
    etoile.vertex(-29, +40);
    etoile.vertex(-23, +7);
    etoile.vertex(-47, -15);
    etoile.vertex(-14, -20);
    etoile.endShape(CLOSE);
  }

//___________________________________________\ affichage de l'etoile /_______________________________________________\\

  void displayES() {
    afficherES();
    bougeES();
    apparitionES();
    prendreES();
  }

  void afficherES() {
    if (afficherES == true) 
    {
      pushMatrix();
      translate(x, y);
      shape(etoile);
      popMatrix();
    }
  }

//___________________________________________\ test de collision /___________________________________________\\

  void prendreES() {

    if (monPerso.x > x)
    {
      persosecret = true; // activation du boolean du perso secret pour l'afficher dans le menu des persos
      disparitionES();
      //      println("oui");
    }
  }

//___________________________________________\ mouvement de l'étoile /___________________________________________\\

  void bougeES() {
    x -= vitesse;
    if ( monPerso.y < hauteur ) { 
      y+= Vcadrage;
    } 
    if ( monPerso.y > base ) { 
      y-= Vcadrage;
    }
  }
    void apparitionES() {
    afficherES = true;
  }  
  void disparitionES() {
    afficherES = false;
  }
}
