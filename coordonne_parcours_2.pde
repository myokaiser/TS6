 //___________________________________________\ petits sauts auto 2/_____________________________________________________\\
 
 ArrayList<PetitSaut> PetitSaut2_ArrayList = new ArrayList<PetitSaut>();
 
 int[][] tabPS2 = { { 350, 1525,700 },
                 { spawn-5, 399 } };

 void initialisationValuePS2 () {
    for (int a = 0; a <  1 ; a++){
     //PetitSaut2_ArrayList.add (new PetitSaut ( "petitsaut" , tabPS2[0][0], tabPS2[1][0]));
     PetitSaut2_ArrayList.add ( new PetitSaut( "sautnormal", tabPS2[0][1], tabPS2[1][1]));
     //PetitSaut2_ArrayList.add ( new PetitSaut( "inverse", tabPS2[0][2], tabPS2[1][0]));
    }
 }

//___________________________________________\ portail perso 2/_____________________________________________________\\

/// tableau coordonee du portail perso \\\
int PosPortail2[][] =  { { finNiv2 , 1600, 1800, 3000 }, //finNiv = 4000
                        { 300, spawn-50, 80, 330 } };

/// instances portail vaisseaux \\\

ArrayList<portailP> parcours2_PortailPerso_ArrayList = new ArrayList<portailP>();

void initialisationValuePP2(){ 
   //parcours2_PortailPerso_ArrayList.add( new portailP ( "sens gravite" , PosPortail2[0][1], PosPortail2[1][0] )); // x= 1600
   //parcours2_PortailPerso_ArrayList.add ( new portailP ( "retour Perso" , PosPortail2[0][3], PosPortail2[1][2])); 
  parcours2_PortailPerso_ArrayList.add ( new portailP ( "Vaisseaux On" , PosPortail2[0][1], PosPortail2[1][1]));
   parcours2_PortailPerso_ArrayList.add( new portailP ( "Fin", PosPortail2[0][0], PosPortail2[1][3]));
  //parcours2_PortailPerso_ArrayList.add ( new portailP ( "FlappyBird On" , PosPortail2[0][1], PosPortail2[1][1])); 
   //parcours2_PortailPerso_ArrayList.add ( new portailP ( "Velocite" , PosPortail2[0][2], PosPortail2[1][2]));
}

//___________________________________________\ teleporteur 2/_____________________________________________________\\

/// tableau coordonee du teleporteur \\\
int [][] posTp2 = { { 950 }, { 420 }, { 120 } };

/// instances portail vaisseaux \\\

ArrayList<teleporteur> parcours2_teleporteur_ArrayList = new ArrayList<teleporteur>();

void initialisationValueTP2(){
  //for(int a=0; a < 1 ; a++)
//   parcours2_teleporteur_ArrayList.add ( new teleporteur ( a , posTp2[0][a], posTp2[1][a], posTp2[2][a])); 
}

//___________________________________________\ parcours super saut 2/_______________________________________________\\

/// tableau coordonee du super saut \\\

int[] [] PosSS2 = { { 3900, 2340 } ,
                   { 150,  350 } }; 

///instances supers sauts \\\

ArrayList<SuperSaut> parcours2_SuperSaut_ArrayList = new ArrayList <SuperSaut>();

void initialisationValueSS2() {
 //  for (int a = 0; a <  1 ; a++){
 // parcours2_SuperSaut_ArrayList.add( new SuperSaut ( a , PosSS2[0][a], PosSS2[1][a]));
 //}
}

//___________________________________________\ parcours triangles 2/_______________________________________________\\

/// tableau coordonnée des triangles \\\

int[][] tabT2 = { { 700, 900, 2000, 1575, 1625, 1675, 1725, 2500, 1900, 5150,5200 },
                 { 200, 399, 50, 399, 399, 399, 399, 50, 260 },
                { -50, 50, -50, 50, 50, 50, 50, -50, 50} };


/// instances triangles \\\

 ArrayList<Obstacle> parcours2_Triangles_ArrayList = new ArrayList<Obstacle>();
 
 void initialitionValueT2 () {
   for (int a = 0; a <  8 ; a++){
   // parcours2_Triangles_ArrayList.add (new Obstacle ( a , tabT2[0][a], tabT2[1][a], tabT2[2][a] ));
   //parcours2_Triangles_ArrayList.add( new Obstacle ( a , tabT2[0][a], tabT2[1][a], tabT2[2][a])); // x = 900 ; y = 399
   //parcours2_Triangles_ArrayList.add( new Obstacle ( a , tabT2[0][a], tabT2[1][a], tabT2[2][a]));
   //parcours2_Triangles_ArrayList.add( new Obstacle ( a , tabT2[0][a], tabT2[1][a], tabT2[2][a]));
   //parcours2_Triangles_ArrayList.add( new Obstacle ( a , tabT2[0][a], tabT2[1][a], tabT2[2][a]));
   //parcours2_Triangles_ArrayList.add( new Obstacle ( a , tabT2[0][a], tabT2[1][a], tabT2[2][a]));
   //parcours2_Triangles_ArrayList.add( new Obstacle ( a , tabT2[0][a], tabT2[1][a], tabT2[2][a]));
   //parcours2_Triangles_ArrayList.add( new Obstacle ( a , tabT2[0][a], tabT2[1][a], tabT2[2][a]));
   //parcours2_Triangles_ArrayList.add( new Obstacle ( a , tabT2[0][a], tabT2[1][a], tabT2[2][a]));

   }
 }
 
 //___________________________________________\ parcours lignes 2/___________________________________________________\\
 
 ///position premiére ligneH\\\ taille saut avec bloc -50
int niv2Ligne1 = 190;
int debut2Ligne1 = 100;
int fin2Ligne1 = 1000;
 
 ///position deuxieme ligneH\\\
int niv2Ligne2 = 50;
int debut2Ligne2 = 1600;
int fin2Ligne2 = 4000;

/////position troisieme ligneH\\\ gravite -50
int niv2Ligne3 = 149;
int debut2Ligne3 = 2050;
int fin2Ligne3 = 2150;

/////position quatrieme ligneH\\\
//int niv2Ligne4 = 350;
//int debut2Ligne4 = 2250;
//int fin2Ligne4 = 2300;

/////position cinquieme ligne\\\ escalier
//int niv2Ligne5 = 250;
//int debut2Ligne5 = 2450;
//int fin2Ligne5 = 2500;

/////position sixieme ligne\\\
//int niv2Ligne6 = 150;
//int debut2Ligne6 = 2650;
//int fin2Ligne6 = 2700;

/////position septieme ligne\\\
//int niv2Ligne7 = 50;
//int debut2Ligne7 = 2850;
//int fin2Ligne7 = 2900;

/////position huitieme ligne\\\
//int niv2Ligne8 = -50;
//int debut2Ligne8 = 3050;
//int fin2Ligne8 = 3100;

/////position neuvieme ligne\\\
//int niv2Ligne9 = 150;
//int debut2Ligne9 = 3200; //LIGNE MODIFIEE
//int fin2Ligne9 = 3700;

/////position dixieme ligne\\\    taille super saut
//int niv2Ligne10 = 200;
//int debut2Ligne10 = 4100;
//int fin2Ligne10 = 4150;

/////position onzieme ligne\\\

//int niv2Ligne11 = 250;
//int debut2Ligne11 = 4200;
//int fin2Ligne11 = 4250;

/////position douxieme ligne\\\
//int niv2Ligne12 = 300;
//int debut2Ligne12 = 4300;
//int fin2Ligne12 = 4350;

/////position trezieme ligne\\\
//int niv2Ligne13 = 50;
//int debut2Ligne13 = 4700;
//int fin2Ligne13 = 5500;
 
 /// tableau coordones des lignes \\\
int[][] PosLignesH2True = { {0, niv2Ligne1, niv2Ligne3},   //niv2Ligne4,   niv2Ligne5,   niv2Ligne6,   niv2Ligne7, niv2Ligne8, niv2Ligne9, niv2Ligne10, niv2Ligne11, niv2Ligne12, niv2Ligne13  } ,
                      {0, debut2Ligne1, debut2Ligne3}, //debut2Ligne4, debut2Ligne5, debut2Ligne6, debut2Ligne7, debut2Ligne8, debut2Ligne9, debut2Ligne10, debut2Ligne11 ,debut2Ligne12, debut2Ligne13 },
                      {0, fin2Ligne1, fin2Ligne3}};   //fin2Ligne4,   fin2Ligne5,   fin2Ligne6,   fin2Ligne7, fin2Ligne8, fin2Ligne9, fin2Ligne10, fin2Ligne11, fin2Ligne12, fin2Ligne13  } }; 
int[][] PosLignesH2False = { {0, niv2Ligne2},   //niv2Ligne4,   niv2Ligne5,   niv2Ligne6,   niv2Ligne7, niv2Ligne8, niv2Ligne9, niv2Ligne10, niv2Ligne11, niv2Ligne12, niv2Ligne13  } ,
                           {0,  debut2Ligne2}, //debut2Ligne4, debut2Ligne5, debut2Ligne6, debut2Ligne7, debut2Ligne8, debut2Ligne9, debut2Ligne10, debut2Ligne11 ,debut2Ligne12, debut2Ligne13 },
                           {0, fin2Ligne2}};   //fin2Ligne4,   fin2Ligne5,   fin2Ligne6,   fin2Ligne7, fin2Ligne8, fin2Ligne9, fin2Ligne10, fin2Ligne11, fin2Ligne12, fin2Ligne13  } };  
boolean [] sens2 = { true, false};

///instances ligne horizontales\\\

ArrayList<parcours_LigneH> parcours2_LigneH_ArrayList = new ArrayList<parcours_LigneH>();

void initialisationValueLH2(){
   parcours2_LigneH_ArrayList.add (new parcours_LigneH ( 0, 0, spawn, 1000,sens2[0]));  
  for (int a = 1; a <=  2 ; a++){
     parcours2_LigneH_ArrayList.add (new parcours_LigneH ( a , PosLignesH2True[1][a], PosLignesH2True[0][a], PosLignesH2True[2][a], sens2[0] ) );// plus 1 pour eviter que le objid de la premiere ligne soit egala 0,ca lui appliquerait la fonction pour la igne base
  }
  for (int a = 1; a <=  1 ; a++){
     parcours2_LigneH_ArrayList.add (new parcours_LigneH ( a , PosLignesH2False[1][a], PosLignesH2False[0][a], PosLignesH2False[2][a], sens[1] ) );// plus 1 pour eviter que le objid de la premiere ligne soit egala 0,ca lui appliquerait la fonction pour la igne base
  }
}

///// intsances lignes verticale\\\

ArrayList<parcours_LigneV> parcours2_LigneV_ArrayList = new ArrayList<parcours_LigneV>();

void initialisationValueLV2(){
//  parcours2_LigneV_ArrayList.add(new parcours_LigneV ( 1 , debutLigne1, spawn, nivLigne1, finLigne1-debutLigne1 ) );
//  parcours2_LigneV_ArrayList.add(new parcours_LigneV ( 2 , debutLigne2, spawn, nivLigne2, finLigne2-debutLigne2 ) );
//  parcours2_LigneV_ArrayList.add(new parcours_LigneV ( 3 , debutLigne3, spawn, nivLigne3, finLigne3-debutLigne3 ) );
//  parcours2_LigneV_ArrayList.add(new parcours_LigneV ( 4 , debutLigne4, spawn,  nivLigne4, finLigne4-debutLigne4 ) );
//  parcours2_LigneV_ArrayList.add(new parcours_LigneV ( 5 , debutLigne5, spawn,  nivLigne5, finLigne5-debutLigne5 ) );
//  parcours2_LigneV_ArrayList.add(new parcours_LigneV ( 6 , debutLigne6, spawn,  nivLigne6, finLigne6-debutLigne6 ) );
//  parcours2_LigneV_ArrayList.add(new parcours_LigneV ( 7 , debutLigne7, spawn,  nivLigne7, finLigne7-debutLigne7 ) );
//  parcours2_LigneV_ArrayList.add(new parcours_LigneV ( 8 , debutLigne8, spawn,  nivLigne8, finLigne8-debutLigne8 ) );
//  ////parcours_LigneV_ArrayList.add(new parcours_LigneV ( 9 , debutLigne12, height,  nivLigne12 ) );
//  ////parcours_LigneV_ArrayList.add(new parcours_LigneV ( 10 , debutLigne10, nivLigne10, nivLigne11 ) );
}

//___________________________________________\ ligne diaguonales /___________________________________________\\

int [][] PosLignesD2 = { { finLigne12, finLigne1}, 
                        { finLigne12+150, debutLigne2+5 },
                        { nivLigne12+10, nivLigne1},
                        { spawn, nivLigne2+5 }   };  

ArrayList<ligneD> parcours2_LigneD_ArrayList = new ArrayList <ligneD>();

void initialisationValueLD2(){
  //for (int a = 0; a <  1 ; a++){
  //   parcours2_LigneD_ArrayList.add(new ligneD ( a , PosLignesD2[0][a], PosLignesD2[1][a], PosLignesD2[2][a], PosLignesD2[3][a] ) );
  //}
}
