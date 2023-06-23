//___________________________________________\ position perso /___________________________________________\\ //<>//
int posYb = spawn - 50, recupPosYb = posYb;  
int posXb = 250, recupPosXb = posXb; // a definir en fonction de width

//___________________________________________\ instance perso /___________________________________________\\
perso monPerso = new perso ();

//___________________________________________\ class du perso /___________________________________________\\

class perso {
  int x, y;

  int forceV = tailleSaut; // definir dans principale, a 16 actuellement
  int forceY = 1; // valeur pour diminuer forceV
  int tailleSS = 25; // forceV pour le super saut

  boolean AEC = true;
  int mauve = #ff00bf, bleuFonce = #3d0099, bleuClair = #33d6ff, vert = #1aff1a, jaune = #ffff00, ornage = #ff8000, rouge =  #ff0000 ;
  int[] couleurs = { mauve, bleuFonce, bleuClair, vert, jaune, ornage, rouge };

  boolean jump = false;
  boolean superjump = false;
  boolean gravite = false;
  boolean affichage = true;
  boolean sensGravite = true;
  boolean petitsaut = false;

  PImage perso; //enlever
  PImage persoInverse; //enlever
  PImage vaisseau; // enlever
  PImage flappybird; // changer, enlever?

  boolean affichagePerso = true; // perso de base
  boolean affichagePerso2 = false; // perso secret

  boolean affichageVaisseau = false; 
  boolean affichageFlappyBird = false;
  boolean activationvelocite = false; // changement de vitesse

  //___________________________________________\ controleur instance perso /___________________________________________\\

  perso() {
    x = 250 ;
    y = spawn - 50;
  }

  //___________________________________________\ affichage du perso /___________________________________________\\

  void display() {

    affichagePerso();
    affichageVaisseau();
    arcCiel();
    affichageFlappyBird();        
    gravite ();
    saute ();
    superSaut();
    PetitSaut();
    vaisseauBouge ();
    flappybirdBouge ();
    finDeLaFenetre();
  }

  //___________________________________________\ affichage des differents perso /___________________________________________\\

// afichage du Perso //

  void affichagePerso() {

    if ( sensGravite )
    {    
      if ( affichagePerso == true  ) { perso1(x, y); particulesOn(); }
      if ( affichagePerso2 == true ) { persosecret(x, y); particulesOff();  }
    }

    if ( !sensGravite )
    {
      if ( affichagePerso == true ) { invperso1(x, y); particulesOn(); } 
      if ( affichagePerso2 == true ){ persosecret(x, y); particulesOff(); }
    }
  }

// afichage du Vaisseau //

  void affichageVaisseau() {
    if ( affichageVaisseau == true )// ♥
    {
      dessineV();      
      stopAEC ();      
      affPersoOff ();
    }
  }

// affichage du flappy bird //

  void affichageFlappyBird() {
    if ( affichageFlappyBird == true )
    {
      //flappybird = loadImage ("flappybird.jpg");
      //image(flappybird, x, y, 50, 50);
      fill(#F2FF43);
      rect(x,y,50,50);
    }
  }

  //___________________________________________\ mouvements pour ligne diaguonale /___________________________________________\\

  void collisionPentePositive () {
    y += vitesse;
  }

  void collisionPenteNegative() {
    y -= vitesse + 5;
  }

  //___________________________________________\ methodes pour adapter l'inversion de gravite /___________________________________________\\

  int modifieurGravite () {
    if (sensGravite) return (1);
    else return (-1);
  }
  int reajustementCoordonneImage () {
    if (sensGravite) return (50);
    else return (0);
  }
  int invReajustementCoordonneImage () {
    if (sensGravite) return (0);
    else return (50);
  }
  int reajustementTrainee(){
    if (sensGravite) return (40);
    else return (0);
  }

  //___________________________________________\ programme gravite /___________________________________________\\

  void gravite () {
    if ( ( gravite == true ) 
      && ( jump == false )
      && (affichageVaisseau == false)
      && (affichageFlappyBird == false)
      && (collisionD == false))
    {
      y+=  Fgravite * modifieurGravite ();
    }
  }

  //___________________________________________\ programme saut /___________________________________________\\    

  void saute () {
    if   (( jump == true )
      &&  ( superjump == false )
      &&  ( affichageVaisseau == false )) 
    { 
      y-=  forceV * modifieurGravite ();
      if (forceV > -18)
      forceV -= forceY;
    }
  }

  //___________________________________________\ programme super saut /___________________________________________\\

  void superSaut () {
    if (!superjump) return;
    {
      forceV = tailleSS;
      y-=  forceV * modifieurGravite (); 
      tailleSS -= forceY;
    }
  }

  //___________________________________________\ programme petit saut /___________________________________________\\ 

  void PetitSaut () {
    if ((petitsaut == true))
    {
      monPerso.forceY = 2;
    }
  }


  //___________________________________________\ programme mouvements du vaisseaux /___________________________________________\\    

  void vaisseauBouge () {
    if  ( affichageVaisseau == true )
    {
      y+=   attractionP * modifieurGravite ();
      modification ();
    }
  }

  void modification () {
    if (( jump == true )
      &&  ( attractionP > -8 )) 
    {
      attractionP -= 1 * modifieurGravite ();
    }
    if (( jump == false ) 
      &&  ( attractionP < 8 ))
    {
      attractionP += 1 * modifieurGravite ();
    }
  }

  //___________________________________________\ programme mouvement du flappy bird /___________________________________________\\    

  void flappybirdBouge () {

    if (( jump == true )
      && ( affichageFlappyBird == true ))
    {
      //y -=  forceV * modifieurGravite ();
      //forceV -= forceY;
    }
  }

  //___________________________________________\ programme vélocité /___________________________________________\\

  void activationvelocite () {
    if (activationvelocite == true)
      vitesse = vitesseX; // augmentation de la vitesse
  }

  void activationvelociteOn () { // boolean responsable de l'activation ou non de vélocité
    activationvelocite = true;
  }

  void activationvelociteOff () { // si boolean à false
    activationvelocite = false;
    vitesse = recupVitesse; // récupération de la vitesse de base à 6
  } 

  //___________________________________________\ traine arc en ciel /___________________________________________\\

  float[] c = { 1.5, 2.3, 3.25, 4, 4.7, 5.4, 6.3};
  float[] c2 ={ 1.8, 2.7, 3.635, 3.8, 4.7, 5.4, 6.1};
  float[] c3 ={ -0.5, 0.4, 1.95, 3, 4, 5.4, 6.7};

  void arcCiel() {
    noStroke();
    if ( AEC == true) 
    {    
      for (int i=0; i < 7; i++) {
        strokeWeight(6);
        stroke(couleurs[i]);
        line(x, y+4+i*7, x-18, screenPos+c[i]*7);
      }
      for (int i=0; i < 7; i++) {
        strokeWeight(5);
        stroke(couleurs[i]);
        line(x-20, screenPos+10+i*5.5, x-38, screenPos2+5+c2[i]*5.5);
      }

      for (int i=0; i < 7; i++) {
        strokeWeight(4);
        stroke(couleurs[i]);
        line(x-40, screenPos2+14+i*4, x-50, screenPos3+19+c3[i]*2.5);
      } 

      for (int i=0; i < 7; i++) {
        strokeWeight(2.5);
        stroke(couleurs[i]);
        line(x-50, screenPos3+17+i*3, x-70, screenPos4+25);
      }
    }
  }


  //___________________________________________\ dessin du vaisseau, des persos /___________________________________________\\  


  void dessineP1() {
    strokeWeight(2);
    stroke(0);
    rect(x, y, 50, 50);
  }

 //Dessin vaisseau\\  

  void dessineV() {
    if ( affichageVaisseau == true ) {
      strokeWeight(2);   
      stroke(#0016CE);
      beginShape();
      fill(#D3CFD0);
      vertex(x+5, y);
      vertex(x+5, y+15);// avant vaisseaux
      vertex(x-75, y+25);
      vertex(x-75, y+27);
      vertex(x-42, y+30);//inclinaison ail
      vertex(x-42, y+35);//bout de l'ail en bas // taille ail 10
      vertex(x-87, y+35);//ici

      vertex(x-90, y+24);//dos du vaisseau
      vertex(x-90, y-7);//dos du vaisseau

      vertex(x-85, y-20);//haut du vaisseau
      vertex(x-42, y-20);//bout de lail
      vertex(x-42, y-15);//taille 10
      vertex(x-75, y-12);
      vertex(x-75, y-10);
      endShape(CLOSE);
      fill(#03A9FF);
      quad(x-82, y-2, 
        x-20, y+2, 
        x-20, y+12, 
        x-82, y+17);
      fill(#FF0303);
      arc(x-90, y, 10, 15, PI/2, 3*PI/2);
      arc(x-90, y+15, 10, 15, PI/2, 3*PI/2);
    }
  }
//___________________________________________\ dessin perso /___________________________________________\\

 // dessin perso 1 (sens gravite) \\
  void perso1(int x, int y) {

    if (affichagePerso2 == false || persos == true)
    {
      fill(#BDA7FF);
      stroke(0);
      strokeWeight(2);
      rect(x, y, 50, 50);
    }
  }
 // dessin perso 1 (!sensgravite) \\
  void invperso1(int x, int y) {

    if (affichagePerso2 == false)
    {
      fill(#BDA7FF);
      stroke(0);
      strokeWeight(2);
      rect(x, y, 50, 50);
    }
  }

  // dessin perso 2 \\

  void persosecret(int x, int y) {
    fill(#85A5A3);
    stroke(0);
    ellipse(x+20, y+30, 35, 35); //interieur joue

    fill(#E507C8);
    strokeWeight(1);
    bezier(x+8, y+45, x+15, y+40, x+30, y+35, x+45, y+45 ); //langue

    strokeWeight(1); // contour
    stroke(255);
    beginShape();
    stroke(255);
    fill(#98E9FF);//couleur remplissage du perso
    vertex(x, y);
    vertex(x+50, y);
    vertex(x+50, y+30);
    vertex(x+20, y+30);
    vertex(x+16, y+33);
    vertex(x+15, y+37);
    vertex(x+16, y+42);
    vertex(x+20, y+45);
    vertex(x+50, y+45);
    vertex(x+50, y+50);
    vertex(x, y+50);
    endShape(CLOSE);

    fill(250); 
    ellipse(x+35, y+15, 15, 15); //oeil derriere
    arc(x+50, y+15, 15, 15, -PI/2, PI/2); //paupiere oeil derriere
    line(x+50, y, x+50, y+30); 

    fill(0); //yeux
    ellipse(x+37, y+15, 5, 5);
    ellipse(x+53, y+14, 3, 3);

    fill(#ADADAD); //paupiere
    arc(x+35, y+15, 15, 15, 0, PI);
    arc(x+50, y+15, 15, 15, 0, PI/2);
  }

//___________________________________________\ programme mort perso hors limite fenetre d'affichage /___________________________________________\\   

  void finDeLaFenetre() {
    if (( y > height ) || ( y < -3000))  
    {
      gameOver ();
    }
  }

//___________________________________________\ programme replacement du perso a 0 /___________________________________________\\    

  void gameOver () {
    {  
      if (niv1) {
        parcours_teleporteur_ArrayList.clear();
        parcours_LigneH_ArrayList.clear();
        parcours_LigneV_ArrayList.clear();
        parcours_SuperSaut_ArrayList.clear();
        parcours_PortailPerso_ArrayList.clear();
        parcours_Triangles_ArrayList.clear();
        parcours_LigneD_ArrayList.clear();
        PetitSaut_ArrayList.clear();
        etoilesecrete_ArrayList.clear();
        leslignes_ArrayList.clear();

        initialisationValueTP();
        initialisationValueLH(); 
        initialisationValueLV(); 
        initialisationValuePP();
        initialisationValueSS();
        initialisationValueMenu();
        initialitionValueT ();
        initialisationValueLD();
        initialisationValuePS();
        initialisationC();
      }

      if (niv2) {  
        parcours2_teleporteur_ArrayList.clear();
        parcours2_LigneH_ArrayList.clear();
        parcours2_LigneV_ArrayList.clear();
        parcours2_SuperSaut_ArrayList.clear();
        parcours2_PortailPerso_ArrayList.clear();
        parcours2_Triangles_ArrayList.clear();
        parcours2_LigneD_ArrayList.clear();
        PetitSaut2_ArrayList.clear();

        initialisationValueTP2();
        initialisationValueLH2();
        initialisationValueLV2();
        initialisationValuePP2();
        initialisationValueSS2();
        initialitionValueT2 ();
        initialisationValueLD2();
        initialisationValuePS2();
      }
      
      if (niv3) {
        parcours3_teleporteur_ArrayList.clear();
        parcours3_LigneH_ArrayList.clear();
        parcours3_LigneV_ArrayList.clear();
        parcours3_SuperSaut_ArrayList.clear();
        parcours3_PortailPerso_ArrayList.clear();
        parcours3_Triangles_ArrayList.clear();
        parcours3_LigneD_ArrayList.clear();
        PetitSaut3_ArrayList.clear();
        
        initialisationValueTP3();
        initialisationValueLH3();
        initialisationValueLV3();
        initialisationValuePP3();
        initialisationValueSS3();
        initialitionValueT3 ();
        initialisationValueLD3();
        initialisationValuePS3();
      }
      
       Decor_ArrayList.clear();  // remise du decore a 0 //
       initialitionValueF ();
      
      if (afficherES) initialisationValueES();  // si l'etoile est chopée, elle ne reapparait plus.
      if (etoileLa) initialisationValueES();   // si etoileLa est activée l'etoiles est toujours la.

      y = spawn - 51;

      stopsaute();
      stopGravite ();
      affPersoOn ();
      affVaisseauOff();
      affFlappyBirdOff ();
      AECOn ();
      stopSS();
      sensGravite = true;
      activationvelociteOff (); // réinitialisation de la valeur vitesse à 6 
                                // si l'on meurt durant un portail vélocité
      posyTexte = 200; 
      posxTexte = 500; 

      if ((niv1 == true ) || (niv2 == true) || (niv3 == true)) i+=1;
 
       if (longueur1 >= pourcentage1){ // la longueur1 du rectangle est enregistrée et transformée en pourcentage
        pourcentage1 = longueur1; // si la longueur1 est inférieur à la longueur1 précédente qui apparait sous forme de pourcentage1
        }                        // alors la valeur de la longueur1 reste inchangée
    
       if (longueur2 >= pourcentage2){
       pourcentage2 = longueur2;
       }
       
       if (longueur3 >= pourcentage3){
       pourcentage3 = longueur3;
       }

      attractionP = 0;// vaisseau changer de place
      r = 0; v = 0; b = 0; // réinitialisation des variables du décor à 0
    }
  }

// particules \\
 void particulesOn(){
   particules = true;
   AEC = false;
 }
 void particulesOff(){
   particules = false;
   AEC = true;
 }

// arce en ciel \\  
//boolean stopAEC(){
//  return false;
//}
    void stopAEC () {
    AEC = false;
  }   
  void AECOn () {
    AEC = true;
  }

// petit saut // 
  void debutPS () {
    petitsaut = true;
  }

  void stopPS () {
    petitsaut = false;
  }
// Saut //
  void debutsaute() {
    jump = true;
  }
  void stopsaute() {
    jump = false;
  }

// Super saut //
  void debutSS() {
    superjump = true;
  }
  void stopSS() {
    superjump = false;
  }

// activation desactivation de la gravite//
  void stopGravite () {
    gravite = false;
  }   
  void graviteOn () {
    gravite = true;
  }

// affichage du perso principale // 
  void affPersoOn () {
    affichagePerso = true;
  }
  void affPersoOff () {
    affichagePerso = false;
  }

// affichage du perso secret //   
  void affPerso2On () {
    affichagePerso2 = true;
  }
  void affPerso2Off () {
    affichagePerso2 = false;
  }

// affichage du vaisseau //
  void affVaisseauOn () { 
    affichageVaisseau = true;
  }
  void affVaisseauOff () {
    affichageVaisseau = false;
  }

// affichage du flappy bird //
  void affFlappyBirdOn () {
    affichageFlappyBird = true;
  }
  void affFlappyBirdOff () {
    affichageFlappyBird = false;
  }
}

//___________________________________________\ recuperation des anciennes position du perso /___________________________________________\\

int screenPos, screenPos2, screenPos3, screenPos4;

void recuperationPosxPersoFramePrecdente() {
  screenPos4 = screenPos3;  
  screenPos3 = screenPos2; 
  screenPos2 = screenPos;
  screenPos = monPerso.y;
}

//___________________________________________\ dessin des particules derriere le perso /___________________________________________\\

void ajoutParticules ()
  {  
    if (particules == true && monPerso.AEC == false )
     particules_ArrayList.add(new particule(250, monPerso.y + monPerso.reajustementTrainee())); 
  }

void arrayListParticules()
   {     
    for (int i = particules_ArrayList.size()-1; i >= 0; i--) { 

    particule lesParticules = particules_ArrayList.get(i);
    lesParticules.bouge();
    lesParticules.afficher();

    if (lesParticules.mort()) {
      particules_ArrayList.remove(i);
   }    
  }
 }


class particule {
  
  float x;
  float y;
  float vitesseY,vitesseX;
  float gravity;
  float w;
  float life;
  
  int mauve = #ff00bf, bleuFonce = #3d0099, bleuClair = #33d6ff, vert = #1aff1a, jaune = #ffff00, ornage = #ff8000, rouge =  #ff0000 ;
  int[] couleurs = { mauve, bleuFonce, bleuClair, vert, jaune, ornage, rouge };
  color  couleur;
  
  particule(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    w = random(2,8);
    vitesseY = random(0.2,3);  
    vitesseX = random(2,8);
    gravity = random(0.12,0.15);
    couleur = couleurs[int(random(0,couleurs.length))];//variable declare ici sinon le random est tt le temps chage ca clignote
  }
  
    void bouge() {
    vitesseY = vitesseY - gravity;
    y = y - vitesseY;
    x = x - vitesseX;
    w = w - 0.4;

    if (monPerso.jump == false && y > monPerso.y+50) {
      vitesseY = vitesseY * -0.9;
      y = monPerso.y;
    }
  }
  
  boolean mort() {
    if ( w <= 0) {
      return true;
    } else {
      return false;
    }
  }
  
  void afficher() {

    fill(couleur);
    stroke(couleur);
    rect(x,y,w,w);

  }
} 
