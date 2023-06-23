class Obstacle{ // création d'une classe pour les obstacles (triangles)
   int x;
   int y;
   int tailleTriangle;
   int objId;
   boolean collision = false;
   
    PImage triangle;

   Obstacle (int id, int nouvX, int nouvY, int TAILLETRIANGLE){
   objId = id;
   x=nouvX;
   y=nouvY;
   tailleTriangle = TAILLETRIANGLE;
   }

   void display(){
      move(); // fonction de déplacement des obstacle 
      stroke(255);
      fill(255, 0, 0);
     triangle(x, y, x+25, y-tailleTriangle, x+50, y); // plus tailleTriangle augmente et plus le triangle sera haut
     collisionOB ();
   }

   void move(){
    x -= vitesse; // revient à dire x-= 6
    if ( monPerso.affichageVaisseau == false )
     {
      if ( monPerso.y < hauteur ){ y+= Vcadrage;  } 
      if ( monPerso.y > base ){ y-= Vcadrage; }    
     }
   }

   int reajustementCoordonneImage(){ // création de fonction int pour test de collision 
  if(tailleTriangle > 0){ return(50); // des triangles normaux et inverses
  }
  else { return (0);
}
}

int invReajustementCoordonneImage(){
    if(tailleTriangle > 0){ return(0);
  }
  else { return (50);
}
}

   //___________________________________________\ collision obstacle /___________________________________________\\

  void collisionOB () {
    if (( monPerso.x+50 >= x) 
    &&  ( monPerso.x <= x+50)  
    &&  ( monPerso.y+50 >= y-reajustementCoordonneImage()) //si la taille est positive (50), on a monPerso.y+50 >= y-50
    &&  (monPerso.y <= y+invReajustementCoordonneImage ())){ //si la taille est positive (50), on a monPerso.y <= y+0
  {                   // si le triangle est pointé vers le bas (-50) alors les fonctiond int vont afficher l'inverse
    monPerso.gameOver (); // et on obtiendra un test de collision adapté à un triangle inverse: monPerso.y+50 >= y-0
    //collisionOn ();//                                                                           monPerso.y <= y+50
  } // si les conditions sont réunis, cela renvoit à l'activation du boolean collision = true, et provoque un game over
 }
}
     boolean mort() {
    if ( x+50 < 0 ) {
      return true;
    } else {
      return false;
    }
  }

 // void collisionOn (){
 //  collision = true;
 //}
 //void collisionOff (){
 //  collision = false;
 //}
}
