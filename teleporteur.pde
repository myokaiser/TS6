//___________________________________________\ class portail perso /___________________________________________\\
class teleporteur {
  int x, y, yTp;
  int objId;
  boolean collision = false;

  teleporteur (int id,int nouvX, int nouvY, int nouvyTp){
    objId = id;
    x = nouvX;
    y = nouvY; 
    yTp = nouvyTp;
}

//___________________________________________\ affichage du portail perso /___________________________________________\\

void displayTp () {
  ellipse( x, y, 80, 50);
  ellipse( x-50, yTp, 80, 50);
  bouge();
  teleportation();
}

//___________________________________________\ mouvement du portail perso /___________________________________________\\

void bouge() {
  x-= vitesse;
  if ( monPerso.affichageVaisseau == false )
   {
    if ( monPerso.y < hauteur ) { y+= Vcadrage; yTp+= Vcadrage; }
    if ( monPerso.y > base ) { y-= Vcadrage;  yTp-= Vcadrage; }
   }
  }
  
//___________________________________________\ detection /___________________________________________\\

void teleportation() {
   if ( ( monPerso.x+50 > x ) // les x sont la taille du portail en largeur
  &&   ( monPerso.x < x+100 )
  &&   ( monPerso.y > y-150 ) // les y sont la taille du portail en longueur
  &&   ( monPerso.y < y+100 ) ) // a voir pour l'enlever jsp qui me remet la collison a false
  {
    monPerso.y = yTp;
    monPerso.graviteOn();
  }
 }
}
