int j; //<>// //<>//
//v-17
//___________________________________________\\ programme central //_______________________________________________\\

//par rapport au niveau\\
int finNiv1 = 13000, finNiv2 = 5000, finNiv3 = 4000;      // position du portail de fin en absisse
boolean fin_de_niveau1 = false; // boolean qui sert à l'activation de la page de fin de niveau
boolean fin_de_niveau2 = false;
boolean fin_de_niveau3 = false;
int vitesseD = 1, recupVitesseD = vitesseD; // vitesse du décor 
int r = 0, v = 0, b = 0; // variables de couleur du décor à 0 de base

//par rapport au personnage\\
int vitesse = 6, recupVitesse = vitesse;  // vitesse et variable pour reinitialiser la vitesse
int tailleSaut = 16;                      // hauteur du saut
int Fgravite = 7;                         // force de la gravite
int attractionP = 0;                      //variable de force pour le vaisseau, a mettre dans la classe
int spawn = 390;                          // position de base
int vitesseX = 15;                        // vitesse accélération pour vélocité
boolean particules = true;
ArrayList<particule> particules_ArrayList;

//par rapport a l'interface\\
boolean chargementjeu = true;
boolean menu = true;
boolean nivos = false;
boolean niv1 = false;
boolean niv2 = false;
boolean niv3 = false;
boolean jeu = false;
boolean afficherES = true;
boolean etoileLa = false;                  // pour que l'etoile s'enleve des que tu la choppe
boolean persos = false;

//par rapport a la fenetre\\
int hauteur = 50; 
int base = 420;
int Vcadrage = 5;

//___________________________________________\ setup: musique et sons, declaration des tableaux objets dans la memoire heap /_______________________________________________\\

void setup () {
  size(1000, 550);
  
  particules_ArrayList = new ArrayList<particule>();
  
  // objets parcours 1
  initialisationValueTP();
  initialisationValueLH(); 
  initialisationValueLV(); 
  initialisationValuePP();
  initialisationValueSS();
  initialisationValueMenu();
  initialitionValueT ();
  initialisationValueLD();
  initialisationValueES();
  initialisationValuePS();
  initialisationC();
  initialitionValueF (); // a decomenter
  
  // objets parcours 2
  initialisationValueTP2();
  initialisationValueLH2();
  initialisationValueLV2();
  initialisationValuePP2();
  initialisationValueSS2();
  initialitionValueT2 ();
  initialisationValueLD2();
  initialisationValuePS2();
  
  //objets parcours 3
  initialisationValueTP3();
  initialisationValueLH3();
  initialisationValueLV3();
  initialisationValuePP3();
  initialisationValueSS3();
  initialitionValueT3 ();
  initialisationValueLD3();
  initialisationValuePS3();
}


//___________________________________________\ boucle /_______________________________________________\\

void draw () {
  if (niv1 == true || niv2 == true){
  background(30); } else background(0);
   
   frameRate (60);
   barreDeChargement();

  if ((chargementjeu == false )
  && ( menu == true )) // condition d'apparition du menu principal
  {
    for (int i=0; i < 3 ; i++) { // affichage par boucle des 3 premiers boutons 
      Menu_ArrayList.get(i).display(); // qui constituent le menu principal
    }
  }
  
   if (menu == false) // si menu = false, affichage permanent du bouton retour 
   {
    Menu_ArrayList.get(3).display();
   }

  if (nivos == true) 
  {
    imageNiveaux (); // affichage des trois boutons de niveaux
    Menu_ArrayList.get(4).display();
    Menu_ArrayList.get(7).display();
    Menu_ArrayList.get(8).display();
  }

  if (persos == true) // affichage des boutons persos
  {
    imagePersos ();
    Menu_ArrayList.get(5).display();

     if ( persosecret == true ){
    Menu_ArrayList.get(6).display();
    }
  }

  if (niv1 == true) 
  {
    nivos = false; // création du décor avant le niveau, pour que le fond soit mis en arrière plan
     for (int i=0; i < Decor_ArrayList.size(); i++) {
    Decor_ArrayList.get(i).display();
  }
    debutNiv1();
  }

  if (niv2 == true) 
  {
   nivos = false;
   for (int i=0; i < Decor_ArrayList.size(); i++) {
    Decor_ArrayList.get(i).display();
  }
   debutNiv2();
  }

  if (niv3 == true) 
  {
   nivos = false;
   
   for (int i=0; i < Decor_ArrayList.size(); i++) {
    Decor_ArrayList.get(i).display();
  }   
   debutNiv3();   
  }
  
  if((fin_de_niveau1 == true) || (fin_de_niveau2 == true) || (fin_de_niveau3 == true)){
  fin_de_niveau(); // affichage de la page de fin de niveau si l'un des 3 niveaux est fini
  }
}

  

//___________________________________________\ controles /_______________________________________________\\ 

boolean possibiliteSaut = true;//utile pour pauser

void keyReleased() {
  if (( keyCode == UP )
    && ( monPerso.affichageVaisseau == true ))
  {
    monPerso.stopsaute();
  }
}
void keyPressed () {
 
  if (  keyCode ==  UP ) 
  {
    if (( monPerso.gravite == false ) 
     && ( possibiliteSaut == true ))
    {
      monPerso.debutsaute();
    }

    if ( monPerso.affichageFlappyBird == true )//il manque peut etre debut saute
    {
      monPerso.forceV = tailleSaut;
    }
  }
//___________________________________________\ pause /___________________________________________\\

  if ( ( key == ' ' )
    &&   ( possibiliteSaut == true ) ) {  //il fallait un boolean pr pas faire tourner un boucle le bail alors j'ai pris le plus proche
    //  noLoop();
    vitesse = 0;
    vitesseD = 0;
    possibiliteSautOff ();
    monPerso.stopGravite ();   // j'aurais aussi pu ajouter la condition possibiliteSaut == true

} else if ( ( key == ' ')
    &&  ( possibiliteSaut == false ) ) { 
    //  loop();
    vitesse = recupVitesse;  
    vitesseD = recupVitesseD;
    possibiliteSautOn ();
    monPerso.graviteOn ();
  }
  
 if ( key == 'g') monPerso.gameOver();
}

void possibiliteSautOn () {
  possibiliteSaut = true;
}
void possibiliteSautOff () {
  possibiliteSaut = false;
}

//___________________________________________\ niveau 1/_______________________________________________\\ 

void debutNiv1() {
  
  ajoutParticules();
  arrayListParticules();
  
  monPerso.display();
  
  affCompteur();
  affBarreProg();
  recuperationPosxPersoFramePrecdente(); 
  dessinRetour();

  for( ligne sol : leslignes_ArrayList){
    sol.displayrect();
    sol.displayligne();    
    sol.jebouge();
    sol.jereviens();
  }
  
  for( int i = 0; i < parcours_LigneD_ArrayList.size(); i++){
    ligneD ligneDiaguonale = parcours_LigneD_ArrayList.get(i);
    ligneDiaguonale.display();
    
    if (ligneDiaguonale.mort()){
      parcours_LigneD_ArrayList.remove(i);
   }
  }

  for (int i=0; i < parcours_Triangles_ArrayList.size(); i++) {
    Obstacle triangles = parcours_Triangles_ArrayList.get(i);
    triangles.display();

    if (triangles.mort()) {
      parcours_Triangles_ArrayList.remove(i);
   }
  }

   for (teleporteur TP : parcours_teleporteur_ArrayList){
   TP.displayTp();
   }

  for (int i=1; i < parcours_LigneH_ArrayList.size(); i++) {
    parcours_LigneH_ArrayList.get(i-1).displayLHb();
    parcours_LigneH lignesHorizontales = parcours_LigneH_ArrayList.get(i);
    lignesHorizontales.displayLH();

    if (lignesHorizontales.mort()) {
      parcours_LigneH_ArrayList.remove(i);
   }
  }

  for (int i=0; i < parcours_LigneV_ArrayList.size(); i++) {
    //parcours_LigneV_ArrayList.get(i).displayLV();
     parcours_LigneV lignesVerticales = parcours_LigneV_ArrayList.get(i);
     lignesVerticales.displayLV();
      
      if (lignesVerticales.mort()) {
      parcours_LigneV_ArrayList.remove(i);
   }
  }
  
  for( int i = 0; i < parcours_SuperSaut_ArrayList.size(); i++){
    SuperSaut superSaut = parcours_SuperSaut_ArrayList.get(i);
    superSaut.displaySS();

    if (superSaut.mort()) {
      parcours_SuperSaut_ArrayList.remove(i);
   }    
  }

  for (int i=0; i < parcours_PortailPerso_ArrayList.size(); i++) {
    //parcours_PortailPerso_ArrayList.get(i).displayPP();
    portailP portail = parcours_PortailPerso_ArrayList.get(i);
    portail.displayPP();
    
    if(portail.mort()){
      parcours_PortailPerso_ArrayList.remove(i);
    }
  }
  
  for (etoile etoileSecrete  : etoilesecrete_ArrayList ){
    etoileSecrete.displayES();
  }
  
  for ( int i = 0; i <  PetitSaut_ArrayList.size(); i++){
    PetitSaut petitSaut = PetitSaut_ArrayList.get(i);
    petitSaut.displayPS();
    
    if (petitSaut.mort()){
      PetitSaut_ArrayList.remove(i);
    }    
  }

}

//___________________________________________\ niveau 2 /_______________________________________________\\ 
 
void debutNiv2(){
 
   ajoutParticules();
   arrayListParticules();
   arrayListParticules();
   affCompteur();
   affBarreProg();
   recuperationPosxPersoFramePrecdente();
   monPerso.display();

   dessinRetour();

  for (int i=0; i < parcours2_LigneD_ArrayList.size(); i++) {
    parcours2_LigneD_ArrayList.get(i).display();
  }

  for (int i=0; i < parcours2_Triangles_ArrayList.size(); i++) {
    parcours2_Triangles_ArrayList.get(i).display();
  }

  for (int i=0; i < parcours2_teleporteur_ArrayList.size(); i++) {
    parcours2_teleporteur_ArrayList.get(i).displayTp();
  }

  for (int i=1; i < parcours2_LigneH_ArrayList.size(); i++) {
    //parcours2_LigneH_ArrayList.get(i).displayLH();
    parcours2_LigneH_ArrayList.get(i-1).displayLHb(); // lecture de la ligne base 
     
    parcours_LigneH lignesHorizontales = parcours2_LigneH_ArrayList.get(i);
    lignesHorizontales.displayLH();
    lignesHorizontales.displayLHb();

    if (lignesHorizontales.mort()) {
      parcours2_LigneH_ArrayList.remove(i);
   }
  }

  for (int i=0; i < parcours2_LigneV_ArrayList.size(); i++) {
    parcours2_LigneV_ArrayList.get(i).displayLV();
  }

  for (int i=0; i < parcours2_SuperSaut_ArrayList.size(); i++) {
    parcours2_SuperSaut_ArrayList.get(i).displaySS();
  }

  for (int i=0; i < parcours2_PortailPerso_ArrayList.size(); i++) {
    parcours2_PortailPerso_ArrayList.get(i).displayPP();
  }

  for(int i=0; i < PetitSaut2_ArrayList.size(); i++) {
    PetitSaut2_ArrayList.get(i).displayPS();
  }
}

//___________________________________________\ niveau 3 /_______________________________________________\\ 
 
void debutNiv3(){
     particules_ArrayList.add(new particule(250, monPerso.y + monPerso.reajustementTrainee())); 
  arrayListParticules();
   affCompteur();
   affBarreProg();
   recuperationPosxPersoFramePrecdente();
   dessinRetour();
   
   monPerso.display();
   
     for( ligne sol : leslignes_ArrayList){
    sol.displayrect();
    sol.displayligne();    
    sol.jebouge();
    sol.jereviens();
  }
   

  for (int i=0; i < parcours3_PortailPerso_ArrayList.size(); i++) {
    parcours3_PortailPerso_ArrayList.get(i).displayPP();
  }


  for (int i=0; i < parcours3_LigneD_ArrayList.size(); i++) {
    parcours3_LigneD_ArrayList.get(i).display();
  }

  for (int i=0; i < parcours3_Triangles_ArrayList.size(); i++) {
    parcours3_Triangles_ArrayList.get(i).display();
  }
  
  for (int i=1; i < parcours3_LigneH_ArrayList.size(); i++) {
    parcours3_LigneH_ArrayList.get(i).displayLH();
    parcours3_LigneH_ArrayList.get(i-1).displayLHb();// lecture de la ligne base 
  }

  for (int i=0; i < parcours3_teleporteur_ArrayList.size(); i++) {
    parcours3_teleporteur_ArrayList.get(i).displayTp();
  }

  for (int i=0; i < parcours3_LigneV_ArrayList.size(); i++) {
    parcours3_LigneV_ArrayList.get(i).displayLV();
  }

  for (int i=0; i < parcours3_SuperSaut_ArrayList.size(); i++) {
    parcours3_SuperSaut_ArrayList.get(i).displaySS();
  }

  for(int i=0; i < PetitSaut3_ArrayList.size(); i++) {
    PetitSaut3_ArrayList.get(i).displayPS();
  }
  
  //for(int i=0; i < leslignes_ArrayList.size(); i++) {
  //  leslignes_ArrayList.get(i).displayrect();
  //}
}
