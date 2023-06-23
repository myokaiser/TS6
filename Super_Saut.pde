//___________________________________________\ class du super saut /___________________________________________\\

class SuperSaut {
  int x;
  int y;
  int objId;
  
  int tailleSS = 60;
  
//___________________________________________\ controleur instance superSaut /___________________________________________\\

  SuperSaut (int nouvobjId,int nouvX, int nouvY){
    objId = nouvobjId;
    x = nouvX;
    y = nouvY;
  }
  
void displaySS (){
  stroke (250);
  ellipse (x,y,42,16);
  SSBouge ();
  activationSS ();
}

//___________________________________________\ mouvement super saut /___________________________________________\\

void SSBouge () {    
    x -=  vitesse;  
 if ( monPerso.affichageVaisseau == false )
   {
    if ( monPerso.y < hauteur ) y+= Vcadrage;   
    if ( monPerso.y > base ) y-= Vcadrage;    
   }
  } 
  
//___________________________________________\ activation du super saut /___________________________________________\\

void activationSS (){
  if (( (monPerso.x+50 ) >= ( x-tailleSS )) 
  && (( monPerso.x+50  )  <= ( x+tailleSS )) 
  && (( monPerso.y+50  )  >= ( y-20 )) 
  && (( monPerso.y+50  )  <= ( y+20 )) 
  && ( monPerso.jump == true ))
  {
  monPerso.debutSS ();
  }
 }
 
 boolean mort() {
    if ( x+42 < 0) {
      return true;
    } else {
      return false;
    }
  }
}
