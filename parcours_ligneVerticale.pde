boolean activationSauteLigneV = false;  

//___________________________________________\ classe des lignes verticales /___________________________________________\\

class parcours_LigneV {
  int x, y, y2;
  int objId;
  boolean collision = false;
  int hauteurRect;
  int longueurRect;

parcours_LigneV (int id, int nouvX, int nouvY, int nouvY2, float NouvLongueurRect, int LongueurRect ) {
    objId = id;
    x = nouvX+5;
    y = nouvY;
    y2 = nouvY2;
    hauteurRect = int(NouvLongueurRect/16.6666666666);
    longueurRect = LongueurRect * 3;
  }

 void displayLV () {
   collision ();
   ligneVBouge ();
   dessine();
 }
 
 void dessine(){
   strokeWeight(2);
   stroke (131,131,131,127);
   fill(1,0, 0, 127);
   for(int ii = 1; ii <= hauteurRect;ii++){
     for (int i = 1; i <= longueurRect; i++){
      rect( x+i*17-15, y2+ii*17-3, 15,15);
      } 
  }
 }
 
 
//___________________________________________\ mouvement la ligne verticale /___________________________________________\\

 void ligneVBouge () {   
   x -= vitesse;
       if ( monPerso.affichageVaisseau == false )
     {
      if ( monPerso.y < hauteur ) { y+= Vcadrage; y2+= Vcadrage; }
      if ( monPerso.y > base ) { y-= Vcadrage; y2-= Vcadrage; }
     }
   }

//___________________________________________\ collision avec la ligne verticale /___________________________________________\\

 void collision (){ 
   if ( ( monPerso.y+50 > y2 ) 
   &&   ( monPerso.y+50 <= y )
   &&   ( monPerso.x+50 >= x-10 )
   &&   ( monPerso.x+50 < x+20 )) 
   {
//   collisionOn ();
   monPerso.stopsaute ();
   monPerso.gameOver ();
   }
 }
 
  boolean mort() {
    if ( x < 0) {
      return true;
    } else {
      return false;
    }
  }
 //void collisionOn (){
 //  collision = true;
 //}
 //void collisionOff (){
 //  collision = false;
 //}
}
