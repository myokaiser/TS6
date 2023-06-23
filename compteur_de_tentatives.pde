//___________________________________________\ dessin du trangle de retour /___________________________________________\\

 void dessinRetour(){
   strokeWeight(3);
   stroke(#FF0000);
   fill(250);
    triangle(PosImage[0][3],PosImage[1][3]+25, PosImage[0][3]+45, PosImage[1][3], PosImage[0][3]+45, PosImage[1][3]+50);
 }

//___________________________________________\ compteur de tentatives /___________________________________________\\

int posxTexte = 500;
int posyTexte = spawn - 200;
int i = 0;
PFont texte;

void affCompteur(){
  fill(250);
  texte = loadFont("VerdanaPro-CondBlackItalic-30.vlw");
  textFont(texte);
  text("essaye encore ca fait que "+ i + " fois que tu meurs après tout" , posxTexte, posyTexte);
   posxTexte-= vitesse;
   if ( monPerso.affichageVaisseau == false )
   {
    if ( monPerso.y < hauteur ) posyTexte+= Vcadrage;   
    if ( monPerso.y > base ) posyTexte-= Vcadrage;    
   }
}

//___________________________________________\ barre de progression /___________________________________________\\

int longueur1 = 0; // variable suivant le niveau joué
int longueur2 = 0;
int longueur3 = 0;
int pourcentage1 = 0;
int pourcentage2 = 0;
int pourcentage3 = 0;

 void affBarreProg(){ // fonction qui exécute le programme en fonction du niveau joué
  progression1(); //peut etre inutile
  progression2();
  progression3();
 
  strokeWeight(2);
  stroke(#AF4CAE);

  noFill();
  rect(312.5,35,375,20); //cadre
  fill(#5882FF); // couleur interieur barre de prog

  if(niv1 == true){
   rect(312.5, 35, longueur1, 20); // rectangle de progression, le x augmente continuellement
  }

  if(niv2 == true){
   rect(312.5, 35, longueur2, 20);
  }

  if(niv3 == true){
   rect(312.5, 35, longueur3, 20);
  }

}


int progression1(){
  if(niv1 == true){
  longueur1 = 410 - parcours_PortailPerso_ArrayList.get(0).x*410/finNiv1; //le rectangle n'atteint jamais la valeur de 400 
  }                                // à cause du programme retour du portail fin, il faut donc modifier la taille du cadre
  return(longueur1); // fonction int qui transforme la valeur de longueur en "410%"
}

int progression2(){
  if(niv2 == true){
  longueur2 = 410 - parcours2_PortailPerso_ArrayList.get(0).x*410/finNiv2; // finNiv1, 2, 3 correspond au x des portails de fin 
  }                                                                 // qui diminue continuellement à cause de vitesse = 6
  return(longueur2);
}

int progression3(){
  if(niv3 == true){
  longueur3 = 410 - parcours3_PortailPerso_ArrayList.get(0).x*410/finNiv3; // changer le 400 en 410
  }
  return(longueur3);
}

//___________________________________________\ barre de chargement de jeu /_______________________________________________\\

int chargement = 0; // la barre commence à x = 0 de longueur
int resteBoule;
int positionBoule;


void barreDeChargement(){ // simulation de barre de chargement comme dans les vrais jeux
    if (chargementjeu == true){ // le boolean est de base à true
      
     titre = loadImage("logo jeu.png");
     image(titre, 400, 50, 200, 200);
      
    strokeWeight(1);
  stroke(#00ECFF);
  
  boules();
  
  noFill();
  rect(312, 400, 376, 20); // cadre du rectangle de chargement
  chargement();
  fill(255);
  rect(312, 400, chargement, 20); // rectangle de chargement
    }
    if ( chargement == 376 ){
  chargementjeu = false; //lorsque la barre est rempli, la fonction ne réapparait plus
    }
}

void chargement(){ // effet d'accélération et de décélération 
  if( chargement <= 60 ){
     chargement+= 3;
  }
  if(( chargement >= 60 ) && ( chargement <= 300 )){
      chargement+= random(0, 10);
  }
  if (( chargement >= 300 ) && ( chargement <= 375 )){
       chargement+= 1;
  } 
    fill(255);
  texte = loadFont("VerdanaPro-CondBlackItalic-30.vlw");
  textFont(texte); // affichage du texte pour le chargement 
  text("chargement : "+ chargement*100/375 + "%" , 370, 450); // conversion de la variable chargement en pourcentage 
}
//___________________________________________\ boules de chargement /_______________________________________________\\

void boules(){ // fonction modulo 
   for (int i=0; i<3; i++){
    if(i == 0){
      resteBoule = millis()/500 % 3; 
   if (resteBoule == 0){  positionBoule=345;
} else { positionBoule=355; // position en y qui change en fonction du reste qui est renvoyé
    }
    }
    if(i == 1){
      resteBoule = millis()/500 % 3;
   if (resteBoule == 1){ positionBoule=345;
} else { positionBoule=355;
    }
    }
    if(i == 2){
      resteBoule = millis()/500 % 3;
   if (resteBoule == 2){ positionBoule=345;
} else { positionBoule=355;
    }
    }
    fill(255);
    ellipse(465+30*i, positionBoule, 10, 10); // création des boules avec écart de 
  }
}
