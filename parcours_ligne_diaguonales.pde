 boolean collisionD;

class ligneD {

  int x1, x2, y1, y2;
  float f_y1, f_y2, f_x1, f_x2;
  float a, b;
  int id;
  
  ligneD(int ID, int X1, int X2, int Y1, int Y2) {
    id = ID;
    x1 = X1;
    x2 = X2;
    y1 = Y1;
    y2 = Y2;
  }

void display() {
  bouge ();
  ligne ();
}

void calc () {
    f_y1 = float(y1);// convertion des entiers en flottants, 
    f_y2 = float(y2);// stockage de cette valeur dans f_y2 ici
    f_x1 = float(x1);
    f_x2 = float(x2);
    a = valeurA ();
    b = valeurB (a);
}

void bouge () {
  x1 -= vitesse;
  x2 -= vitesse;
if ( monPerso.affichageVaisseau == false )
   {
    if ( monPerso.y < hauteur ) { y1+= Vcadrage; y2+= Vcadrage; }//println("non" + j++); }
    if ( monPerso.y > base ) { y1-= Vcadrage;  y2-= Vcadrage; }// println("oui" + j++);  }
   }
  calc ();
}

  float valeurA () {  
    if ( (f_x2 - f_x1) == 0 ) {
      println("Erreur: division par zero");
      return 0.0;
    }
    float f_a = ( f_y2 - f_y1 )/( f_x2 - f_x1 ); 
    return f_a;
  }

  float valeurB (float f_a) {  
    float f_b = ( f_y1 - f_a * f_x1 );
    return f_b;
  }
  
  void ligne () {
    if (x1 == x2) // tracage de la courbe si la elle est parralléle à l'axe des ordonnées 
    {
      for (int y = y1; y < y2; y++ ) {
        point(x1, y);
      }
    } else {     // tracage de la courbe sans cas particulier
      for (int x = x1; x < x2; x++ ) {
        stroke(250);
        point( x, a * x + b );
      }

      if ( ( ( monPerso.x + monPerso.reajustementCoordonneImage() ) >=  (( ( monPerso.y + monPerso.reajustementCoordonneImage() ) - b) / a ) )   // si les x perso depassent ceux de la ligne        
       &&  ( a < 0 )                                                                                                                                                         
       &&  ( (monPerso.y + monPerso.reajustementCoordonneImage ()) >= a * (( monPerso.x + monPerso.reajustementCoordonneImage() ) + b) ))  // si les y perso depassent ceux de la ligne 
       {                                                                                                                                   // dans le cas d'une pente negative                                                                                    
           if ( (monPerso.x + monPerso.reajustementCoordonneImage () >= x1) && ( monPerso.x + monPerso.reajustementCoordonneImage () <= x2 )) // tant que le perso ne depasse pas le bout de la ligne 
         {  
           monPerso.collisionPenteNegative ();  //  diminution des y
           monPerso.stopsaute();                // boolean jump mis à true
           collisionD = true;                   // activation de la collision avec la ligne verticale
           attractionP = 0;                     // arret du vaisseau, on peut le remplacer par gameOver           
         }                                               
      }

       if ( ( monPerso.x + monPerso.invReajustementCoordonneImage ()) >= ( ((monPerso.y + monPerso.reajustementCoordonneImage ()) - b) / a ) // si les x perso depassent ceux de la ligne 
       &&   ( a > 0 )                                                                                                                    
       &&  (( monPerso.y + monPerso.reajustementCoordonneImage () ) >= a * (( monPerso.x+ monPerso.invReajustementCoordonneImage ()) + b) )) // tant que les y du perso sont au dessus de la ligne // dans le cas d'une pente positive
          {
             if   ( (monPerso.x >= x1) && ( monPerso.x <= x2 ))
             {                                        // quand le perso ne depasse pas le bout de la ligne 
               collisionD = true;                     // pour eviter que la gravite s'active, comme elle s'active des que le perso quitte la ligne 
               monPerso.collisionPentePositive ();    // augmentation des y
               monPerso.stopsaute();                  // boolean jump mis à false
               attractionP = 0;                       // arret du vaisseau, on peut le remplacer par gameOver
             }
          }

       }
    }
    
    boolean mort() {
    if ( x2 < 0) {
      return true;
    } else {
      return false;
    }
  }
 }
      
