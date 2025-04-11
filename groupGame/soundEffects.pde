import ddf.minim.*;
import ddf.minim.AudioPlayer;

class SoundEffects {
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

  SoundEffects(Minim minim) {
    start = false;
    hurt = false;
    heal = false;
    strike = false;
    item = false;
    num = -1;
    num2= -2;
    this.minim = minim;
    Grunt1 = minim.loadFile("SoundEffects/Player_hitV2.mp3");
    Grunt2 = minim.loadFile("SoundEffects/Player_hitV2.1.mp3");
    Grunt3 = minim.loadFile ("SoundEffects/Player_hitV2.2.mp3");
    Ehit1 = minim.loadFile ("SoundEffects/Enemy_hit1.mp3");
    Ehit2 = minim.loadFile ("SoundEffects/Enemy_hit2.mp3");
    Ehit3 = minim.loadFile ("SoundEffects/Enemy_hit3.mp3");
    Healing = minim.loadFile ("SoundEffects/heart_pickup.m4a");
  }


  void update() {

    //if (start) {
    //BackgroundMusic.play();
    //} else {
    //BackgroundMusic.stop();
    //}


    if (hurt) {
      num = (int)random(1, 4);
      if (num == 1) {
        Grunt1.play();
      } else if (num == 2) {
        Grunt2.play();
      } else if (num == 3) {
        Grunt3.play();
      }
    } else {
      hurt = false;
      num = -1;
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
      } else if (num ==-2) {
        Ehit1.pause();
        Ehit2.pause();
        Ehit3.pause();
      } else {
        num2 = -2;
        strike = false;
      }
    }

    //if (item) {
    //Cheer.play();
    //} else {
    //Cheer.stop();
    //}

    //if (walking) {
    //Walking.play();
    //} else {
    //Walking.stop();
    //}


    //if (room) {
    //  Room.play();
    //} else {
    //  Room.stop();
    //}
  }
}
