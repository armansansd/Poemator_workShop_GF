import processing.pdf.*;
import java.sql.Timestamp;
import java.util.Date;
PFont font;
PFont fontdate;
int fsize = 11 ;
int compteur = 0;

//liste mots
String nounSing[] = {
  "le fleuve épinglé", "la lune qui cuit", 
  "le feu de mes délices", "le vieux Rhin", "sa face ruisselante", "la terre", 
  "l'autan", "la forêt", "une armée antique", "une grotte avide", "le soleil d'hier", "la tzigane", 
  "l'amour lourd", "l'oiseau bleu", "un ermite", "un crâne blanchi", "le pré","la mère","ça","un journaliste","le Danois","Jacques","la patronne",
  "la femme","une troupe de casquettiers","mon attente vaine","un foetus minuscule","tendre été","ton biplan","un hareng saur","la clef des paupières",
  "le malheur",
};
String verbSing[] = {
  "flambe", "dansera", "soulève", "s'est desarmé", "sert de cible", "s'écrie", 
  "mange", "buvait aussi", "dansa debout", "cria JE VOUS MAUDIS", "regarda longtemps les rives", 
  "n'a pas chanté aujourd'hui", "a fermé sa porte", "a pris les églantines", "inventait de la poésie", 
  "brûle", "dit", "sufit","vint","entourait","regarde","pensa","montre","vivait","tua l'invinsible, ","s'acharna","s'assoit","me regarde",
  "chante","partit","rêve","confie ses secrets","souffre","reviendra","croque",
};
String comp[] = {
  "sur la ville", "mieux que les séraphins", "dans le brasier", "à l'ardeur adorable", 
  "en robe de comtesse", "comme un oeuf sur le plat", "à côtè du Dauphin", "en automne", "longeant le Rhin", 
  "avant d'entrer dans ma cellule", "nuit et jour","dans les sphingeries", "où pense la lumière", "qu'enfin on m'y dévorât", 
  "quand je passerai", "quand nous voulûmes", "avec tant d'harmonie", "chaque matin", "dans une fosse", "dans la cellule d'à côté", 
  "à l'intérieur de ses vitrines", "dans ce cimetière", "sur la côte du Texas", "dans le jardin", "au fond du Rhin", 
  "devant des sites ingénus", "auprès de moi","à Smyrne à Naples en Tunisie","pour l'eternité","parmi vous","où il nage","sur les débris du monde",
};
String oSing[] = {
  "Ô grand maître", "Ô Paris", "Ô belle", "Ô mémoire", "Ô lion", "Ô belle nuit", "Ô ma tête inquiète","cortèges ô cortèges",
  "ô nuit",
};
String oSingPonctu[] = {
  " ! Elle", " ! Il",
};
String lig[] = {
  "et", "mais",
};

String ponctu[] ={"","","","","","","","","","",", "," ! "," ; ","","","","","","","","","","","","","","","",""};
//fin liste mots

//variable phrase
int nbSentence = 4;
String sentence[] = new String[nbSentence];
String couplet[] = new String[nbSentence];

void setup() {
  background(255);  
  size(595, 842); //A4 72dpi
  smooth();
  frameRate(1);
  //noLoop();

  //def font
  font = createFont("Times New Roman", fsize);
  fontdate = createFont("Consolas", 13);

  //créer les phrases
  for (int j = 0; j<nbSentence; j++) {
    sentence[j] = "";
    couplet[j] = "";
  }
}

void draw() {

 if (compteur == 0) {
    beginRecord(PDF, "Poeme-#######.pdf");
    background(255);
    fill(0);

    //date + heure
    textFont(fontdate, fsize);
    int d = day();    // Values from 1 - 31
    int m = month();  // Values from 1 - 12
    int y = year();   // 2003, 2004, 2005, etc.
    String t1 = String.valueOf(d);
    text(t1+" .", width/2-38,100);
    t1 = String.valueOf(m);
    text(t1+" .", width/2-8, 100); 
    t1 = String.valueOf(y);
    text(t1, width/2+22, 100);

    rectMode(CENTER);
    rect(width/2, 113, 50, 1);

    int h = hour();    // Values from 1 - 31
    int mn = minute();  // Values from 1 - 12
    int s = second();   // 2003, 2004, 2005, etc.
    String t2 = String.valueOf(h);
    text(t2+" ", width/2-30,135);
    t2 = String.valueOf(mn);
    text(t2+" ", width/2-5, 135); 
    t2 = String.valueOf(s);
    text(t2, width/2+18, 135);

    //debut compos text
    textFont(font, fsize);
    
    for (int j = 0; j<nbSentence ; j++) {
      if (int(random(400))%2==0 && j%2==0) {
        sentence[j] = oSing[int(random(oSing.length))]+oSingPonctu[int(random(oSingPonctu.length))]+" "+verbSing[int(random(verbSing.length))]+" "+comp[int(random(comp.length))];
      }
      else if (int(random(400))%3==0 && j%2==1) {
        sentence[j] = lig[int(random(lig.length))]+" "+nounSing[int(random(nounSing.length))]+" "+verbSing[int(random(verbSing.length))]+" "+comp[int(random(comp.length))]+ponctu[int(random(ponctu.length))];
      }
      else {
        sentence[j] = nounSing[int(random(nounSing.length))]+" "+verbSing[int(random(verbSing.length))]+" "+comp[int(random(comp.length))]+ponctu[int(random(ponctu.length))];
      }

      String lettre = sentence[j].substring(0, 1);
      lettre = lettre.toUpperCase();
      String suite = sentence[j].substring(1);
      String sentenceMaj = lettre + suite;

      fill(0);
      text(sentenceMaj, 160, 300+j*fsize*1.2);
    }


    if (int(random(2))==1) {
      for (int j = 0; j<nbSentence ; j++) {

        if (int(random(400))%2==0 && j%2==0) {
          sentence[j] = comp[int(random(comp.length))]+oSingPonctu[int(random(oSingPonctu.length))]+" "+verbSing[int(random(verbSing.length))]+" "+comp[int(random(comp.length))];
        }
        else if (int(random(400))%3==0 && j%2==1) {
          sentence[j] = lig[int(random(lig.length))]+" "+nounSing[int(random(nounSing.length))]+" "+verbSing[int(random(verbSing.length))]+" "+comp[int(random(comp.length))];
        }
        else if (int(random(400))%5==0 && j%2==1) {
          sentence[j] = nounSing[int(random(nounSing.length))]+" "+verbSing[int(random(verbSing.length))]+ponctu[int(random(ponctu.length))];
        }
        else {
          sentence[j] = nounSing[int(random(nounSing.length))]+" "+verbSing[int(random(verbSing.length))]+" "+comp[int(random(comp.length))]+ponctu[int(random(ponctu.length))];
        }

        //majuscule
        String lettre = sentence[j].substring(0, 1);
        lettre = lettre.toUpperCase();
        String suite = sentence[j].substring(1);
        String sentenceMaj = lettre + suite;

        fill(0);
        text(sentenceMaj, 160, 366+j*fsize*1.2);
      }

      for (int j = 0; j<nbSentence ; j++) {

        if (int(random(400))%2==0 && j%2==0) {
          sentence[j] = oSing[int(random(oSing.length))]+oSingPonctu[int(random(oSingPonctu.length))]+" "+verbSing[int(random(verbSing.length))]+" "+comp[int(random(comp.length))];
        }
        else if (int(random(400))%3==0 && j%2==1) {
          sentence[j] = lig[int(random(lig.length))]+" "+nounSing[int(random(nounSing.length))]+" "+verbSing[int(random(verbSing.length))]+" "+comp[int(random(comp.length))];
        }
        else {
          sentence[j] = nounSing[int(random(nounSing.length))]+" "+verbSing[int(random(verbSing.length))]+" "+comp[int(random(comp.length))];
        }

        String lettre = sentence[j].substring(0, 1);
        lettre = lettre.toUpperCase();
        String suite = sentence[j].substring(1);
        String sentenceMaj = lettre + suite;

        fill(0);
        text(sentenceMaj, 160, 432+j*fsize*1.2);
      }
}
    endRecord();
    compteur = 20;
  }
  else {
    compteur --; 
  }
}

