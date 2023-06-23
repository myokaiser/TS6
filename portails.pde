//___________________________________________\ class portail perso /___________________________________________\\
class portailP {
  int x, y;

  int reste;
  int vitesseDeplacement = 50; //valeur allant de 5 en 5, plus la valeur est haute et moins il y aura de mouvement
  String objId;

  boolean collision = false;

  color couleur;
  color couleurPV = color(0, 255, 0); // couleur pour les flèches du portail vélocité (PV)
  color couleurPortailOff = color(58); // couleur gris foncé pour les portails avec luminausité éteinte
  
  /// couleur spécifique à chaque type de portail\\\
  color couleur_sensGravite = color(0, 255, 255); // variable de couleur en fonction du type de portail qui est spécifié par le string id
  color couleur_retourPerso = color(255, 255, 0);
  color couleur_vaisseauxOn = #FF05C9;
  color couleur_fin = color(255);
  color couleur_flappyBirdOn = #05FF2C;
  color couleur_velocite = #FFF305;

  portailP (String id, int nouvX, int nouvY) {
    objId = id;
    x = nouvX;
    y = nouvY;
  }

  //___________________________________________\ affichage du portail perso /___________________________________________\\

  void displayPP () {
    bouge();
    transfoP (); // activation des fonctions des portails (collision)
    dessine(); // dessin des différents portails
    fleches(); // fonction des flèches du portail de vélocité
  }

  //___________________________________________\ mouvement du portail perso /___________________________________________\\

  void bouge() {
    x-= vitesse;
    if ( monPerso.affichageVaisseau == false )
    {
      if ( monPerso.y < hauteur ) y+= Vcadrage;   
      if ( monPerso.y > base ) y-= Vcadrage;
    }
  }

  //___________________________________________\ test de collison du portail perso avec le vaisseaux (ou autre si on se chauffe) /___________________________________________\\

  void transfoP () {
    if ( ( monPerso.x+50 >= x ) // les x sont la taille du portail en largeur
      &&   ( monPerso.x+50 <= x+50 )
      &&   ( monPerso.y >= y-150 ) // les y sont la taille du portail
      &&   ( monPerso.y <= y+50 )) 
    {
      if ( objId == "FlappyBird On" )
      {
        monPerso.affFlappyBirdOn(); // affichage perso 
        monPerso.affPersoOff();
        monPerso.sensGravite = true; 
        //monPerso.stopAEC ();
      }

      if ( objId == "retour Perso" ) 
      {
        monPerso.activationvelociteOff(); // retour à la vitesse normale, c'est-à-dire 6
        monPerso.affPersoOn ();
        monPerso.affVaisseauOff();
        monPerso.graviteOn();
        monPerso.sensGravite = true;
        monPerso.forceV = tailleSaut;
        particules = true;
          if( (b<= 240)){ // la fonction qui active les fonctions des portails apporte aussi des modifications au fond du jeu
           b+=20; // ici pour le portail de type "retour Perso" la couleur du fond (initialement gris) va évoluer vers du bleu
           }
          if(( r>= 0) || (v>= 0)){ // tandis que les deux autres vont être réduit à 0
           r-=20;
           v-=20;
           }
      }  

      if ( objId == "Vaisseaux On" ) 
      {
        monPerso.affVaisseauOn();
        monPerso.affPersoOff();
        monPerso.stopsaute();
        particules = false;
        //monPerso.sensGravite = true;
        //monPerso.stopAEC ();
      }

      if ( objId == "sens gravite" )
      {
        monPerso.sensGravite = false;        
        if ( monPerso.jump == false ) monPerso.graviteOn();
       
        if( (v<= 240)){
        v+=20;
        }
        if(( b>= 0) || (v>= 0)){
        b-=20;
        v-=20;
        }        
      }

      if ( objId == "Fin"  )
      {
       
        if (niv1 == true){ // en fonction du niveau joué, le portail va enclencher différentes fonctions
        monPerso.gameOver(); // par exemple pour le niveau 1, il va y avoir une réinitialisation du niveau par intervention du Game Over
        niv1 = false; // une désactivation du boolean niv1, ce qui entraine la disparition du niveau 1
        fin_de_niveau1 = true; // et une apparition de la page de fin de niveau
      }
        if (niv2 == true){
        monPerso.gameOver();
        niv2 = false;
        fin_de_niveau2 = true;
      }
        if (niv3 == true){
          monPerso.gameOver();
          niv3 = false;
          fin_de_niveau3 = true;
        }
      }

      if ( objId == "Velocite" )
      {
        monPerso.activationvelociteOn(); // active le boolean activationvelocite à true
        monPerso.activationvelocite(); // activation de la fonction vélocité après avoir mis le boolean à true
        if( v<= 240){
        v+=20;
        }
        if(( r>= 0) ||  (b>= 0)){
        r-=20;
        b-=20;
        }
      }
    }
  }

  void dessine() {
// animation des portails par effet de cligniotement \\
   reste = second() % 2; // effet d'animation se reposant sur le temps qui fonctionne sur le jeu de nombre pair et impair grace au modulo et à second()
  if (reste == 0){ // si second() % 2 vaut 0 (cela correspond à un nombre pair), la lumière du portail sera activée
    if( objId == "sens gravite" ){ // on associe à chaque type de portail (id) une couleur différente qui est définie au début de la classe
    couleur = couleur_sensGravite;
  }
  
  if( objId == "retour Perso" ){
    couleur = couleur_retourPerso;
  }
  
  if( objId == "Vaisseaux On" ){
    couleur = couleur_vaisseauxOn;
  }
  
  if( objId == "Fin" ){
    couleur = couleur_fin;
  }
  
  if( objId == "FlappyBird On" ){
    couleur = couleur_flappyBirdOn;
  }
  
  if( objId == "Velocite" ){
    couleur = couleur_velocite;
  }
}
  else { couleur = couleurPortailOff; // en revanche si second() % 2 ne renvoie pas à 0 
}                                    // (c'est-à-dire qu'il ne correspond pas à un nombre paur) alors le programme affecte une couleur grise

  for (int i=1; i<=5; i++){ //constructeur de portail par boucle

    if ( i == 2 || i == 4 ){ //affectation de couleur en fonction du i
    stroke(couleur);         //et en fonction du portail
    } else stroke(255, 0, 0); // seul les cercles du portail au rang i = 2 ou 4 sont spécifiques selon le type de portail

    strokeWeight(4);

    if ( i == 1 || i==3 ||  i == 5  ){ //affectation de remplissage de couleur en fonction du i
    fill(0,0,0);
    } else noFill();


   ellipse(x-i*10, y, 35+i*3, 30+i*15);    
  }

   for (int i=0; i<10; i++){
     noFill();
     stroke(0+i*25,0,0);
     strokeWeight(6.5);
     ellipse(x-32-i*2, y, 0+i*4.5, 2+i*10.5); 
   }
   
  fill(couleur); // création de sphères autour du cercle rouge des portails
  stroke(couleur); // également soumis à l'animation en fonction des types de portail
  ellipse(x-51, y-60, 5, 5); // création des sphères en fonction de x et y de chaque portail 
  ellipse(x-20, y-20, 5, 5);
  ellipse(x-20, y+20, 5, 5);
  ellipse(x-51, y+60, 5, 5); 
  ellipse(x-81, y+20, 5, 5);
  ellipse(x-81, y-20, 5, 5);
   
}

void fleches(){ // programme de flèche affecté à l'appel d'un portail de vélocité
  if( objId == "Velocite" ){
  for (int i=0; i<6; i++){ // création par boucle, = 6 flèches créées
    if(i == 0){
      reste = millis()/vitesseDeplacement % 6; // utilisation de la fonction millis() afin d'avoir des valeurs plus vites que second()
   if (reste == 0){ couleur = couleurPV; // malheureusement millis() est trop rapide de base, il faut donc la diviser pour la ralentir 
} else { couleur = color(58); // ici division par 50
    }                        // pour que chaque flèche s'active individuellement il faut donc utiliser un modulo 6
    }                        // la division par 6 à l'infini affichera pour reste 0, 1, 2, 3, 4 et 5
    if(i == 1){
      reste = millis()/vitesseDeplacement % 6; // chaque fois que reste affiche une certaine valeur, 
   if (reste == 1){ couleur = couleurPV; // la flèche deviendra verte pour le i en question
} else { couleur = color(58); // le reste sera éteint, c'est-à-dire de couleur grise
    }
    }
    if(i == 2){
      reste = millis()/vitesseDeplacement % 6;
   if (reste == 2){ couleur = couleurPV;
} else { couleur = color(58);
    }
    }
    if(i == 3){
      reste = millis()/vitesseDeplacement % 6;
   if (reste == 3){ couleur = couleurPV;
} else { couleur = color(58);
    }
    }
    if(i == 4){
      reste = millis()/vitesseDeplacement % 6;
   if (reste == 4){ couleur = couleurPV;
} else { couleur = color(58);
    }
    }
    if(i == 5){
      reste = millis()/vitesseDeplacement % 6;
   if (reste == 5){ couleur = couleurPV;
} else { couleur = color(58);
    }
    }
    stroke(couleur);
    fill(couleur);   
  beginShape(); // fonction pour créer des formes libres
  vertex(x+51*i, y-15); // création des flèches en fonction de x et y du portail vélocité
  vertex(x+50+51*i, y-15); // avec un écart de 1 pour chaque flèche
  vertex(x+55+51*i, y+17.5);
  vertex(x+50+51*i, y+50);
  vertex(x+51*i, y+50);
  vertex(x+5+51*i, y+17.5);
  endShape(CLOSE); // fin de céation de la forme de la flèche
  }
  }
}
boolean mort() {
    if ( x+100 < 0) {
      return true;
    } else {
      return false;
    }
  }
}
