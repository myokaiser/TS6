
//___________________________________________\ class des lignes horizontales /___________________________________________\\

class parcours_LigneH {
  int x, y, x2; 
  int objId;
  int tailleTrou = 15;

  boolean collision = false;
  boolean sens = true;
  

  //___________________________________________\ controlleur instance ligne horizontale /___________________________________________\\

  parcours_LigneH (int id, int nouvX, int nouvY, int nouvX2, boolean Sens) {
    objId = id;
    x = nouvX;
    y = nouvY;
    x2 = nouvX2;
    sens = Sens;

  }

//___________________________________________\ affichage ligne hoizontale et fonctions de la classe  /___________________________________________\\

  void displayLH () {

    if (objId != 0){
    dessine();
     ligneHBouge();
    finSauteLigne ();
    graviteLHon ();
    collisionLH ();
    vaisseauLigneV ();
    }
  }

void displayLHb (){ // la ligne base celle qu'on peut pas depasser et qui bouge pas

    if ( objId == 0 )
   {
    // for (int i = 0; i<500; i++){
    //  strokeWeight(1);
    //  stroke(i,i,i);
    //  point(i, 390);
    //  point(1000-i, 390);
    //}
    stroke(250);
    line(0,y,1000,y);
     finSauteLigne ();
    if ( monPerso.affichageVaisseau == false ){
    if ( monPerso.y < hauteur ){ y+= Vcadrage; }
    if ( monPerso.y > base ) { y-= Vcadrage;  }  
   }
  }
}

// dessin de nos lignes

void dessine(){
  strokeWeight(2);
      stroke(250);
      fill(0);
        if (sens)
        {
         rect(x, y, x2-x, 10);
        } else rect(x,y,x2-x,-10);
}

  //___________________________________________\ mouvement lignes /___________________________________________\\

  void ligneHBouge () {
    x -=  vitesse;
    x2 -=  vitesse;
if ( monPerso.affichageVaisseau == false )
   {
    if ( monPerso.y < hauteur ){ y+= Vcadrage; }  
    if ( monPerso.y > base ){ y-= Vcadrage; }  
   }
  }   

  //___________________________________________\ fin du saut en fonction de la ligne /___________________________________________\\

  void finSauteLigne () {//est active en permanence

    if (( monPerso.x+50 >= x )
      &&  ( monPerso.x <= x2 ) 
      &&  ( monPerso.y + monPerso.reajustementCoordonneImage () >= (y-10) ) 
      &&  ( monPerso.y + monPerso.reajustementCoordonneImage () <= (y+10) )
      &&  ( monPerso.affichageVaisseau == false ))
    {  
      monPerso.stopsaute ();
      monPerso.stopSS ();
      monPerso.stopPS ();

      monPerso.forceV=tailleSaut;
      monPerso.tailleSS=20;
      monPerso.forceY = 1;

      monPerso.stopGravite ();
      reabilitation ();
      collisionD = false;
      if ( monPerso.affichageFlappyBird == true ) monPerso.gameOver();
    }
  }
  void reabilitation () {
    if ( ( monPerso.sensGravite )
      && ( monPerso.y != y - 50))
    { 
      monPerso.y = y - 50;
    } else if (( monPerso.y != y)
             && (monPerso.sensGravite ==  false)) monPerso.y = y;
  }

  //___________________________________________\ fin du saut en fonction de la ligne en vaisseaux /___________________________________________\\

void vaisseauLigneV () {
if  (( monPerso.x+50 > x )
  && ( monPerso.x+50 < x2 )
  && ( monPerso.affichageVaisseau == true )) 
  {
    if (( monPerso.y > y )
     && ( monPerso.y <= y +15 )
     && ( monPerso.jump == true )) 
      {
       attractionP = 0;
      }

    if (( monPerso.y+45 < y ) 
     && ( monPerso.y+45 > y-10 ) 
     && ( monPerso.jump == false ))
      {
       attractionP = 0;
      }
 }
}

  //___________________________________________\ gravite en fonction de la ligne /___________________________________________\\

  void graviteLHon () {
    if ( ( monPerso.x >= x2-1 )  
      && ( monPerso.x <= x2 + tailleTrou )
      && ( monPerso.affichageVaisseau == false ))    
    {  
      if (( monPerso.y + monPerso.reajustementCoordonneImage() >= y  )
      && ( monPerso.y + monPerso.reajustementCoordonneImage() <= y + 15  )
      && ( monPerso.jump == false))  
      { 
        monPerso.graviteOn (); 
      }
    }
  }

  //___________________________________________\ collision en dessous de la ligne /___________________________________________\\

  void collisionLH () { // on peut le mettre dans fin saute ligne pour l opti mais flemme
    if ( ( monPerso.x+50 >= x ) 
      &&   ( monPerso.x <  x2 ) 
      &&   ( monPerso.y + monPerso.invReajustementCoordonneImage() >  y )
      &&   ( monPerso.y +  monPerso.invReajustementCoordonneImage() < y+10 )
      &&   ( monPerso.jump == true ) 
      &&   ( collision == false )
      &&   ( monPerso.forceV > 0 ) )
    {
      monPerso.gameOver();
      collisionOn ();
    }
  }
  
   boolean mort() {
    if ( x2 < 0 &&  objId != 0 ) {
      return true;
    } else {
      return false;
    }
  }

  void collisionOn () {
    collision = true;
  }
  void collisionOff () {
    collision = false;
  }
}
