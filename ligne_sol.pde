
ArrayList <ligne> leslignes_ArrayList = new ArrayList <ligne>();                        // arraylist <nomdelaclasse> nomdelarraylist = new arraylist <nomdelaclasse>

int [] PosLigne =  {0, 200, 400, 600, 800, 1000};

void initialisationC() {
 
leslignes_ArrayList.add(new ligne("rectangle", 0));
  for (int i=0; i<6; i++) {

    // ligne maLigne = new ligne ("ligne", PosLigne[i]);
    ligne degradligne = new ligne ("degradligne", PosLigne[i]);              // ici je déclare que je veux crée un rectangle/carré  je met new rectangle PosCarre [i] je cree à l'aide de la classe dont le seul paramètre qui change ici x, je place i à sa place et lit le tableau, donc seul x est changé !

    // leslignes_ArrayList.add(maLigne);
    leslignes_ArrayList.add(degradligne);                            // ici j'ajoute ce carré que je veux créer à l'arraylist !
  }
   
}

class  ligne {
  //int largeur;
  //int hauteur;
  int x;
  int y;
  String IdLigne;
  int taillRect, longRect;

  ligne (String LigneId, int NouvX ) {               // <nomdelaclasse> int paramètre
    x = NouvX;            // le seul paramètre qui peut changer ! car tout les autres ont des valeures fixe !! !
    y=0;                       // y = 550;  y = 0 parce que ça deconne avec le moins dans la boucle dégradé ?
    IdLigne = LigneId;
    taillRect = height-spawn;
    longRect = width;
  }

  void displayligne () {

    if ( IdLigne == "degradligne" ){
      strokeWeight(4);
        for (int i =0; i<25; i++) {
         stroke(0,0,0,i*7);                                                // i-y-400 i-y- 550 empeche v cadrage de fonctionner jsais pas pq flemme de reflechir,  //line (x, y+400, x, y+550);//line (x, y, x, y-150);//line (x, y+400, x, y+550);//  //   //y+550, y+400
         line (x+20, y+480+i*4, x-180, y+480+i*4);  
        }    
    noStroke();
    fill(#B2B0B0);
    rect(x, y+spawn, 20, y+height);
    }
  }

  void displayrect () {
   if ( IdLigne == "rectangle" ){ 
    fill(r+50,v+50,b+50);
    noStroke();    
    rect(0, y+spawn, longRect, taillRect);
    fill(#B2B0B0);
    rect(0,  y+spawn,longRect,20);
   }
  }

  void jebouge() {

    if  (IdLigne == "ligne")
      x -= vitesse;

    if (IdLigne == "degradligne")
      x -=vitesse;

    if (monPerso.affichageVaisseau == false) 
    {
      if ( monPerso.y < hauteur ) y+= Vcadrage;   
      if ( monPerso.y > base ) y-= Vcadrage;
    }
  }   

  void jereviens() {

    if ( x+20 < 0)
    {
      x = width+200;
    }
  }
}

//___________________________________________\ fond /___________________________________________\\

ArrayList <decor> Decor_ArrayList = new ArrayList <decor>();

  int [][] Tabf = {{ 0, 255, 510, 765, 1020  },
                     { -145, -115, -85, -55, -25},
                     { 100, 40, 145 },
                     { 100, 40, 145 }};


void initialitionValueF () { // création du décor par double boucle
   for (int a=0; a<5; a++) { // la première lit les valeurs dans l'ordre de 1 à 4
     for (int i=0; i<2; i++) { // la deuxième crée un autre décord en augmentant le y
   Decor_ArrayList.add( new decor (  Tabf[0][a]-45*i, Tabf[1][a]+360*i));
   }
 }
}

  class  decor {
  int x;
  int y;
  int longueur;
  int largeur;
  decor (  int NouvX, int NouvY) {
    x = NouvX;
    y = NouvY;
  }

   void display(){
      fill(80 +r, 80 +v, 80 +b); // le fond varie en fonction de r, v et b
      //strokeWeight(5); // r, v et b sont à 0 de base, le fond est donc gris 
     //stroke(250);
     noStroke();
   bloc();
   jereviens();
   jebouge();

 }
    void jebouge() {
      x -=vitesseD; // revient à dire x-= 2
  }

  void bloc(){ // bloc de carré qui constitue le décor 
    rect(x, y+255, 100, 100);
    rect(x, y+150, 100, 100);
    rect(x+105, y+150, 40, 40);
    rect(x+105, y+195, 40, 40);
    rect(x+105, y+240, 145, 145);
    rect(x+150, y+135, 100, 100);
    rect(x, y, 145, 145);
    rect(x+150, y+30, 100, 100);

  }

    void jereviens() {

    if ( x < -250) // le bloc ayant une longueur totale de 250, 
    {              // à chaque fois que le x du motif est < -250
      x = width; // il prend pour valeur x = 1000 pour donner un effet de répétition
    }
  }
}


  
