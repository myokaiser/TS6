//taille d'un saut normale grosso merdo entre 50 et 100 

//___________________________________________\ petits sauts auto /_____________________________________________________\\

 ArrayList<PetitSaut> PetitSaut_ArrayList = new ArrayList<PetitSaut>();
 
 int[][] tabPS = { { 3000, 3100, 3200 },
                 { spawn-5, spawn-5, spawn-5 } };

 void initialisationValuePS () {
    for (int a = 0; a <  1 ; a++){
     PetitSaut_ArrayList.add ( new PetitSaut( "inverse", tabPS[0][a], tabPS[1][a]));
    }
         //PetitSaut_ArrayList.add (new PetitSaut ( "petitsaut" , tabPS[0][0], tabPS[1][0]));
     //PetitSaut_ArrayList.add ( new PetitSaut( "sautnormal", tabPS[0][1], tabPS[1][0]));
 }

//___________________________________________\ etoiles secrete /_____________________________________________________\\

// différente instances //
int PosEtoiles [][] = { { 1000 }, 
                        {  spawn-50} };

ArrayList<etoile> etoilesecrete_ArrayList = new ArrayList<etoile>();

void initialisationValueES() {
  etoilesecrete_ArrayList.add( new etoile ( PosEtoiles[0][0], PosEtoiles[1][0] ));
}

//___________________________________________\ portail perso /_____________________________________________________\\

/// tableau coordonee du portail perso \\\
int PosPortail[][] =  { { finNiv1 , 3700, 2400 },
                        { 270, spawn-50, spawn - 50 } };

/// instances portail vaisseaux \\\

ArrayList<portailP> parcours_PortailPerso_ArrayList = new ArrayList<portailP>();

void initialisationValuePP(){ 
   parcours_PortailPerso_ArrayList.add( new portailP( "Fin", PosPortail[0][0], PosPortail[1][0]));
   parcours_PortailPerso_ArrayList.add( new portailP ( "sens gravite" , PosPortail[0][1], PosPortail[1][1]));
  // parcours_PortailPerso_ArrayList.add ( new portailP ( "retour Perso" , PosPortail[0][0], PosPortail[1][0])); 
  //parcours_PortailPerso_ArrayList.add ( new portailP ( "Vaisseaux On" , PosPortail[0][1], PosPortail[1][1]));  
  //parcours_PortailPerso_ArrayList.add ( new portailP ( "FlappyBird On" , PosPortail[0][2], PosPortail[1][2])); 
   //parcours_PortailPerso_ArrayList.add ( new portailP ( "Velocite" , PosPortail[0][0], PosPortail[1][1]));
}

//___________________________________________\ teleporteur /_____________________________________________________\\

/// tableau coordonee du teleporteur \\\
int [][] posTp = { { 950 }, { 420 }, { 120 } };

/// instances portail vaisseaux \\\

ArrayList<teleporteur> parcours_teleporteur_ArrayList = new ArrayList<teleporteur>();

void initialisationValueTP(){
  //for(int a=0; a < 1 ; a++)
//   parcours_teleporteur_ArrayList.add ( new teleporteur ( a , posTp[0][a], posTp[1][a], posTp[2][a])); 
}

//___________________________________________\ parcours super saut /_______________________________________________\\

/// tableau coordonee du super saut \\\

int[] [] PosSS = { { 3900, 2340 } ,
                   {  150,  350 } }; 

///instances supers sauts \\\

ArrayList<SuperSaut> parcours_SuperSaut_ArrayList = new ArrayList <SuperSaut>();

void initialisationValueSS() {
   for (int a = 0; a <  1 ; a++){
  //parcours_SuperSaut_ArrayList.add( new SuperSaut ( a , PosSS[0][a], PosSS[1][a]));
 }
}

//___________________________________________\ parcours triangles /_______________________________________________\\

/// tableau coordonnée des triangles \\\

int[][] tabT = { {0, 2650, 3000, 3100, 3200, 3300 },
                 {0, spawn, 100, 100, 100, 100 },
                 {0, 50, -50,-50, -50, -50}};

/// instances triangles \\\

 ArrayList<Obstacle> parcours_Triangles_ArrayList = new ArrayList<Obstacle>();
 
 void initialitionValueT () {
    for (int a = 1; a <=  4 ; a++){
    parcours_Triangles_ArrayList.add (new Obstacle ( a , tabT[0][a], tabT[1][a], tabT[2][a] ));
   }
   //for (int a = 1; a <=  4 ; a++){
   // parcours_Triangles_ArrayList.add (new Obstacle ( a , tabT[0][a], tabT[1][a], tabT[2][1] ));
   //}
 }

//___________________________________________\ parcours lignes /___________________________________________________\\

///position test ligne H\\\
//int nivLigne0 = spawn;
//int debutLigne0 = 0;
//int finLigne0 = 10000;

///position premiére ligneH\\\ taille saut avec bloc -50
int nivLigne1 = 272;
int debutLigne1 = 1600;
int finLigne1 = 1650;

///position deuxieme ligneH\\\
int nivLigne2 = 272;
int debutLigne2 = 1850;
int finLigne2 = 1900;

///position troisieme ligneH\\\ gravite -50
int nivLigne3 = 272;
int debutLigne3 = 2700;
int finLigne3 = 2750;

///position quatrieme ligneH\\\
int nivLigne4 = 100;
int debutLigne4 = 3800;
int finLigne4 = 4100;

///position cinquieme ligne\\\ escalier
int nivLigne5 = 150;
int debutLigne5 = 4100;
int finLigne5 = 4150;

///position sixieme ligne\\\
int nivLigne6 = 150;
int debutLigne6 = 4350;
int finLigne6 = 4400;

///position septieme ligne\\\
int nivLigne7 = 50;
int debutLigne7 = 2850;
int finLigne7 = 2900;

///position huitieme ligne\\\
int nivLigne8 = -50;
int debutLigne8 = 3050;
int finLigne8 = 3100;

///position neuvieme ligne\\\
int nivLigne9 = 150;
int debutLigne9 = 3400;
int finLigne9 = 3700;

///position dixieme ligne\\\    taille super saut
int nivLigne10 = 200;
int debutLigne10 = 4100;
int finLigne10 = 4150;

///position onzieme ligne\\\

int nivLigne11 = 250;
int debutLigne11 = 4200;
int finLigne11 = 4250;

///position douxieme ligne\\\
int nivLigne12 = 300;
int debutLigne12 = 4300;
int finLigne12 = 4450;

///position trezieme ligne\\\
int nivLigne13 = 50;
int debutLigne13 = 4800;
int finLigne13 = 5500;

/// tableau coordones des lignes \\\
int[][] PosLignesHTrue = {{ 0, nivLigne1,   nivLigne2,   nivLigne3,         nivLigne7, nivLigne8, nivLigne9, nivLigne10, nivLigne11, nivLigne12  } ,
                          { 0, debutLigne1, debutLigne2, debutLigne3,   debutLigne7, debutLigne8, debutLigne9, debutLigne10, debutLigne11 ,debutLigne12 },
                          { 0, finLigne1,   finLigne2,   finLigne3,       finLigne7, finLigne8, finLigne9, finLigne10, finLigne11, finLigne12 } };
int[][] PosLignesHFalse = {{ 0, nivLigne4, nivLigne5, nivLigne6,  } ,
                           { 0, debutLigne4, debutLigne5, debutLigne6, },
                           { 0, finLigne4, finLigne5,  finLigne6,  } };                    
                      
boolean [] sens = { true, false};                      

///instances ligne horizontales\\\

ArrayList<parcours_LigneH> parcours_LigneH_ArrayList = new ArrayList<parcours_LigneH>();

void initialisationValueLH(){
   parcours_LigneH_ArrayList.add (new parcours_LigneH ( 0, 0, spawn, 1000, sens[0]));  
  for (int a = 1; a <=  3 ; a++){
     parcours_LigneH_ArrayList.add (new parcours_LigneH ( a , PosLignesHTrue[1][a], PosLignesHTrue[0][a], PosLignesHTrue[2][a], sens[0] ) );// plus 1 pour eviter que le objid de la premiere ligne soit egala 0,ca lui appliquerait la fonction pour la igne base
  }
  for (int a = 1; a <=  3 ; a++){
     parcours_LigneH_ArrayList.add (new parcours_LigneH ( a , PosLignesHFalse[1][a], PosLignesHFalse[0][a], PosLignesHFalse[2][a], sens[1] ) );// plus 1 pour eviter que le objid de la premiere ligne soit egala 0,ca lui appliquerait la fonction pour la igne base
  }
} 

/// intsances lignes verticale\\\

ArrayList<parcours_LigneV> parcours_LigneV_ArrayList = new ArrayList<parcours_LigneV>();

void initialisationValueLV(){
  parcours_LigneV_ArrayList.add(new parcours_LigneV ( 1 , debutLigne1, spawn, nivLigne1, 100, 1 ) );
  parcours_LigneV_ArrayList.add(new parcours_LigneV ( 2 , debutLigne2, spawn, nivLigne2, 100, 1 ) );
  parcours_LigneV_ArrayList.add(new parcours_LigneV ( 3 , debutLigne3, spawn, nivLigne3, 100, 1 ) );
  parcours_LigneV_ArrayList.add(new parcours_LigneV ( 4 , debutLigne6-5, nivLigne6-25,  nivLigne6-75, 50, 1 ) );
  parcours_LigneV_ArrayList.add(new parcours_LigneV ( 5 , debutLigne5, nivLigne5-25,  nivLigne5-75, 50,1 ) );
  //parcours_LigneV_ArrayList.add(new parcours_LigneV ( 6 , debutLigne6, spawn,  nivLigne6, finLigne6-debutLigne6 ) );
  //parcours_LigneV_ArrayList.add(new parcours_LigneV ( 7 , debutLigne7, spawn,  nivLigne7, finLigne7-debutLigne7 ) );
  //parcours_LigneV_ArrayList.add(new parcours_LigneV ( 8 , debutLigne8, spawn,  nivLigne8, finLigne8-debutLigne8 ) );
  ////parcours_LigneV_ArrayList.add(new parcours_LigneV ( 9 , debutLigne12, height,  nivLigne12 ) );
  ////parcours_LigneV_ArrayList.add(new parcours_LigneV ( 10 , debutLigne10, nivLigne10, nivLigne11 ) );
}

//___________________________________________\ ligne diaguonales /___________________________________________\\

int [][] PosLignesD = { { debutLigne1-150, finLigne1, finLigne12}, 
                        { debutLigne1,debutLigne2, finLigne12+170 },
                        { spawn, nivLigne1, nivLigne12},
                        { nivLigne1, nivLigne2, spawn}   };  

ArrayList<ligneD> parcours_LigneD_ArrayList = new ArrayList <ligneD>();

void initialisationValueLD(){
  for (int a = 0; a <  1 ; a++){
     parcours_LigneD_ArrayList.add(new ligneD ( a , PosLignesD[0][a], PosLignesD[1][a], PosLignesD[2][a], PosLignesD[3][a] ) );
  }
}
