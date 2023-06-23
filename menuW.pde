//___________________________________________\ instances des bouton /___________________________________________\\
int PosImage[][] =  { { 660, 660, 660, 35, 280, 500, 400, 270 }, // réorganisation et ajout de fonctions
                      { 375, 206, 35, 35, 60, 250, 250, 420  }, 
                      { 150, 50, 280, 80, 50 } };

ArrayList<boutton> Menu_ArrayList = new ArrayList<boutton>();

void initialisationValueMenu(){ // création de la présence des boutons 
  Menu_ArrayList.add( new boutton ( "quitter", PosImage[0][0], PosImage[1][0], PosImage[2][0], PosImage[2][0] ));
  Menu_ArrayList.add( new boutton ( "perso", PosImage[0][1], PosImage[1][1], PosImage[2][0], PosImage[2][0] ));
  Menu_ArrayList.add( new boutton ( "jouer", PosImage[0][2], PosImage[1][2], PosImage[2][0], PosImage[2][0] ));
  Menu_ArrayList.add( new boutton ( "retour", PosImage[0][3], PosImage[1][3], PosImage[2][1], PosImage[2][1] ));
  Menu_ArrayList.add( new boutton ( "niveau1", PosImage[0][4], PosImage[1][4], PosImage[2][2], PosImage[2][3] ));
  Menu_ArrayList.add( new boutton ( "perso1", PosImage[0][5], PosImage[1][5], PosImage[2][4], PosImage[2][4] ));
  Menu_ArrayList.add( new boutton ( "perso2", PosImage[0][6], PosImage[1][5], PosImage[2][4], PosImage[2][4] ));
  Menu_ArrayList.add( new boutton ( "niveau2", PosImage[0][7], PosImage[1][5], PosImage[2][2], PosImage[2][3] ));
  Menu_ArrayList.add( new boutton ( "niveau3", PosImage[0][7], PosImage[1][7], PosImage[2][2], PosImage[2][3] ));
 }

//___________________________________________\ declaration variable images tourches des menu/___________________________________________\\

//boutons
PImage bouttonquitter; // images des différents boutons principaux
PImage bouttonjouer;
PImage titre;
PImage niveaux;
PImage personnages;
PImage bouttonretour;

//niveaux
PImage nivo1; // images des différents boutons de niveaux
PImage nivo2;
PImage nivo3;

//choix du perso
PImage perso1; // image du perso 1
PImage cadena; // image de cadena tant que le perso secret n'est pas débloqué
boolean persosecret = false; // boolean à false par défault, car l'étoile n'a pas été prise


//___________________________________________\ class du menu/___________________________________________\\

class boutton {
  int x, y;
  String objId;
  int longueurBouton;
  int hauteurBouton;

  boolean lecurseur = false;
  boolean lemenu = true;

  boutton(String id, int NouvX, int NouvY, int LONGUEURBOUTON, int HAUTEURBOUTON) {
    x = NouvX;
    y = NouvY;
    objId = id;
    longueurBouton = LONGUEURBOUTON;
    hauteurBouton = HAUTEURBOUTON;
  }

  void display() {
    diffmain();
    imageNiveaux ();
    onquitte();
    boutonpressed();
    imagePersos ();
    pourcentage();
  }

  void diffmain() { // diff affichage de mains en fonction de la zone des boutons

    if ( ( mouseX > x )
      && ( mouseX < x + longueurBouton )
      && ( mouseY > y )
      && ( mouseY < y + hauteurBouton )
      && ( lecurseur == true ) )
       { 
        j2();
        cursor(HAND);
     }

    else { cursor(ARROW); j();}
  }
  
  void j() {
    lecurseur = true;
  }
  void j2() {
    lecurseur = false;
  }
  void AffichageMenuON() {
    menu = true;
  }
  void AffichageMenuOFF() {
    menu = false;
  }
// regroupement de toutes les fonctions de collision avec les boutons en une seule fonction
  void boutonpressed(){ // fonction lié à la pression de la souris sur les boutons

    if ( mousePressed == true){
      
      if ( ( mouseX > x )
      && ( mouseX < x+longueurBouton )
      && ( mouseY > y )
      && ( mouseY < y+hauteurBouton ) ){
        
// fonctionnement de la touche quitter //

        if (objId == "quitter"){
      exit();
      }
      
// fonctionnement de la touche perso //
 
         if (objId == "perso"){
      menu = false;
      persos = true;
      }
      
// fonctionnement de la touche nivaux //

         if (objId == "jouer"){
      menu = false;
      nivos = true;
      }
      }
      
// fonctionnement BOUTON RETOUR //

     if (( mouseX > x )
     && ( mouseX < x + longueurBouton )
     && ( mouseY > y )
     && ( mouseY < y + hauteurBouton )){
       
     if (  objId == "retour"){
      if ( niv1 == true || niv2 == true || niv3 == true)
      {         
       monPerso.gameOver ();
       i = 0; // variable du compteur remis à 0
      }
     menu = true; // affichage du menu principal et désactivation de toutes les autres pages
     nivos = false; // désactivation menu des niveaux
     niv1 = false; // désactivation des niveaux en cours de jeu
     niv2 = false;
     niv3 = false;
     persos = false;  
     fin_de_niveau1 = false; // désactivation des pages de fin de niveau
     fin_de_niveau2 = false;
     fin_de_niveau3 = false;
    }

// choix perso1 //

    if (  objId == "perso1"){
      monPerso.affPersoOn (); // actibvation du boolean perso1 à true
      monPerso.affPerso2Off(); // actibvation du boolean perso2 à false
      persos = false;
      menu = true; // après choix du perso, retour automatique au menu principal
    }

// choix perso2 //

    if ((  objId == "perso2" ) && (persosecret == true )){ // condition supplémentaire pour le choix du perso secret
      monPerso.affPersoOff ();
      monPerso.affPerso2On();
      persos = false;
      menu = true;
    }
    }

// fonctionnement de la touche du niv 1 //

      if (( mouseX > x )
      && ( mouseX < x+longueurBouton )
      && ( mouseY > y )
      && ( mouseY < y+hauteurBouton ) ){
        if  (objId == "niveau1"){
          monPerso.gameOver ();
         nivos = false;
         niv1 = true;
        }
        
// fonctionnement de la touche du niv 2 //
       if  (objId == "niveau2"){
         monPerso.gameOver ();
         nivos = false;
         niv2 = true;        
        }
// fonctionnement de la touche du niv 3 //        
        if  (objId == "niveau3"){
         monPerso.gameOver ();
         nivos = false;
         niv3 = true;
        }
      }
    }
  }
  void pourcentage(){  // fonction permettant de faire apparaitre des pourcentages
    if (nivos == true ){
     fill(255);
     texte = loadFont("VerdanaPro-CondBlackItalic-30.vlw");
     textFont(texte);
                             // le pourcentage créé lors du game over est converti en pourcentage
      if(objId == "niveau1"){ // selon le niveau auquel on joue
      text("progression : "+ pourcentage1*100/375 + "%" , 312.5, 150); // texte affichant le pourcentage de progression
      }

      if(objId == "niveau2"){
      text("progression : "+ pourcentage2*100/375 + "%" , 312.5, 320);
      }
      
      if(objId == "niveau3"){
      text("progression : "+ pourcentage3*100/375 + "%" , 312.5, 490);
      }
   }
 }

}     


//___________________________________________\ affichage des images des menus /___________________________________________\\
// menu principal
void onquitte() {
   if ( menu == true) { 
     bouttonquitter = loadImage("bouton_quitter.png");
     image(bouttonquitter, PosImage[0][0], PosImage[1][0], PosImage[2][0],PosImage[2][0]); 
     personnages = loadImage("bouton_perso.png");
     image(personnages, PosImage[0][1], PosImage[1][1], PosImage[2][0],PosImage[2][0]);
     titre = loadImage("logo jeu.png");
     image(titre, 130, 50, 400, 400);
     niveaux = loadImage("bouton_jouer.png");
     image(niveaux, PosImage[0][2], PosImage[1][2], PosImage[2][0],PosImage[2][0]);      
    }
}
// menu des niveaux
void imageNiveaux () {
  if (nivos == true )
   {
     dessinRetour();
     nivo1 = loadImage("NIVEAU 1.png");
     image(nivo1, 280, 80); 
     nivo2 = loadImage("NIVEAU 2.png");
     image(nivo2, 270, 250); 
     nivo3 = loadImage("NIVEAU 3.png");
     image(nivo3, 270, 420);     
   }
}

//___________________________________________\ affichage du menu des persos /___________________________________________\\

  void imagePersos () {
  
    if (persos == true )
     {
      dessinRetour();
      stroke  (250);
      line(0, 300, 1000, 300);
        monPerso.perso1(PosImage[0][5], PosImage[1][5] ); // coordonnées changé pour les persos, pour qu'ils soient superposés 
                                                         // à la présence des boutons
       if (persosecret == false){ // affichage du cadena si le perso secret n'est toujours pas débloqué
        cadena = loadImage("blocked_persosecret.png");
        image( cadena, PosImage[0][6], PosImage[1][5], PosImage[2][4], PosImage[2][4]);
          }
          
      if (persosecret == true ){ // affichage du pero secret après obtention de l'étoile
        monPerso.persosecret(PosImage[0][6], PosImage[1][5] );
      }
     }
  }
 
//___________________________________________\ fin niveau panneau bravo /___________________________________________\\

  void fin_de_niveau(){
  i = 0; // le niveau étant fini, remise du compteur à 0
  dessinRetour();
  fill(255);
  texte = loadFont("VerdanaPro-CondBlackItalic-30.vlw");
  textFont(texte);
  text("Congratulation" , 370, 250);
  text("Niveau terminé" , 370, 300);

  if (fin_de_niveau1 == true){ // valeur du pourcentage au maximum lorsque le niveau est terminé
  pourcentage1 = 375; // de cette manière on a 100%
    }

  if (fin_de_niveau2 == true){
  pourcentage2 = 375;
    }

    if (fin_de_niveau3 == true){
  pourcentage3 = 375;
    }

  }
