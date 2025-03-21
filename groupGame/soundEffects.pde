import ddf.minim.*;


class soundEffects {
 boolean start;
  boolean hurt;
  boolean heal;
  boolean strike;
  boolean item;
  int num;
  int num2;
  Minim minim;
  AudioPlayer Grunt1;
  AudioPlayer Grunt2;
  AudioPlayer Grunt3;
  AudioPlayer Ehit1;
  AudioPlayer Ehit2;
  AudioPlayer Ehit3;
  AudioPlayer Healing;


  soundEffects() {
    start = false;
    hurt = false;
    heal = false;
   strike = false;
    item = false;
    num = -1;
    num2= -2;
    minim = new Minim(this);
    Grunt1 = minim.loadFile( "Player_hitV2.mp3");
    Grunt2 = minim.loadFile( "Player_hitV2.1.mp3");
    Grunt3 = minim.loadFile ( "Player_hitV2.2.mp3");
    Ehit1 = minim.loadFile ( "Enemy_hit1.mp3");
    Ehit2 = minim.loadFile ( "Enemy_hit2.mp3");
    Ehit3 = minim.loadFile ( "Enemy_hit3.mp3");
    Healing = minim.loadFile ( "heart_pickup.mp3");
  }


  void display() {

    if (hurt) { 
      num = int(random(1, 3));
    if (num == 1) {
      Grunt1.play();
    } else if (num == 2) {
      Grunt2.play();
    } else if (num == 3) {
      Grunt3.play();
    } else {
      hurt = false;
      num = -1;
    }
  }
    //if (heal) {
    //Healing.play();
    //} else {
    //Healing.stop();
    //}

    if (strike) {
     num2 = int(random(1, 3));
    if (num2 == 1) {
        Ehit1.play();
      } else if (num2 == 2) {
        Ehit2.play();
      } else if (num2 == 3) {
        Ehit3.play();
    }else {
     strike = false;
     num2 = -1;
    }
    }

  }

  }
