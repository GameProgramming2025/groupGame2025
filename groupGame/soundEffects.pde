import ddf.minim.*;
import ddf.minim.AudioPlayer;


class SoundEffects {
  boolean start;
  boolean hurt;
  boolean heal;
  boolean strike;
  boolean item;
  boolean attack;
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


  SoundEffects(Minim m) {
    hurt = false;
    //heal = false;
    strike = false;
    attack = false;
    //item = false;
    num = -1;
    num2= -2;
    this.minim = m;
    grunt1 = minim.loadFile("Data/SoundEffects/Player_hitV2.mp3");
    grunt2 = minim.loadFile("Data/SoundEffects/Player_hitV2.1.mp3");
    grunt3 = minim.loadFile ("Data/SoundEffects/Player_hitV2.2.mp3");
    ehit1 = minim.loadFile ("Data/SoundEffects/Enemy_hit1.mp3");
    ehit2 = minim.loadFile ("Data/SoundEffects/Enemy_hit2.mp3");
    ehit3 = minim.loadFile ("Data/SoundEffects/Enemy_hit3.mp3");
    fireball = minim.loadFile ("Data/SoundEffects/fireballsfx.mp3");
  }


  void update() {

    if (hurt) {
      num = (int)random(1, 4);
      if (num == 1) {
        grunt1.play(0);
      } else if (num == 2) {
        grunt2.play(0);
      } else if (num == 3) {
        grunt3.play(0);
      } else {
        num = -1;
      }
    }

    if (strike) {
      num2 = int(random(1, 3));
      if (num2 == 1) {
        ehit1.play(0);
      } else if (num2 == 2) {
        ehit2.play(0);
      } else if (num2 == 3) {
        ehit3.play(0);
      } else {
        num2 = -1;
      }
    }

    if (attack) {

      if ( !fireball.isPlaying() ) {
        fireball.play(0);
        attack = false;
      }

    }
  }
}
