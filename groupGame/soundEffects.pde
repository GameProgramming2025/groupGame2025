import ddf.minim.*;
import ddf.minim.AudioPlayer;


class SoundEffects {
  boolean start;

  boolean hurt;
  boolean heal;
  boolean strike;
  boolean item;
  boolean shot;
  int num;
  int num2;
  Minim minim;
  AudioPlayer grunt1;
  AudioPlayer grunt2;
  AudioPlayer grunt3;
  AudioPlayer ehit1;
  AudioPlayer ehit2;
  AudioPlayer ehit3;
  AudioPlayer healing;
  AudioPlayer fireball;


  SoundEffects(Minim minim) {
    //start = false;
    hurt = false;
    //heal = false;
    strike = false;
    //item = false;
    shot = true;
    num = -1;
    num2= -2;
    this.minim = minim;
    grunt1 = minim.loadFile("SoundEffects/Player_hitV2.mp3");
    grunt2 = minim.loadFile("SoundEffects/Player_hitV2.1.mp3");
    grunt3 = minim.loadFile ("SoundEffects/Player_hitV2.2.mp3");
    ehit1 = minim.loadFile ("SoundEffects/Enemy_hit1.mp3");
    ehit2 = minim.loadFile ("SoundEffects/Enemy_hit2.mp3");
    ehit3 = minim.loadFile ("SoundEffects/Enemy_hit3.mp3");
    fireball = minim.loadFile ("SoundEffects/Fireballsfx.mp3");
  }


  void update() {



    if (hurt) {
      num = (int)random(1, 4);
      if (num == 1) {
        grunt1.play();
      } else if (num == 2) {
        grunt2.play();
      } else if (num == 3) {
        grunt3.play();
      }
    } else {
      hurt = false;
      num = -1;
    }

    if (strike) {
      num2 = int(random(1, 3));
      if (num2 == 1) {
        ehit1.play();
      } else if (num2 == 2) {
        ehit2.play();
      } else if (num2 == 3) {
        ehit3.play();
      } else {
        strike = false;
        num2 = -1;
      }
    }

    if (shot) {
      fireball.play();
    } else {
      fireball.pause();
      shot = false;
    }
    
  }  
}
