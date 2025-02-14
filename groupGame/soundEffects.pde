
import processing.sound.*;

class soundEffects {
  boolean start;
  boolean hurt;
  boolean heal;
  boolean strike;
  boolean item;
  int num;
  int num2;
  SoundFile Grunt1;
  SoundFile Grunt2;
  SoundFile Grunt3;
  SoundFile Ehit1;
  SoundFile Ehit2;
  SoundFile Ehit3;

  soundEffects() {
    start = false;
    hurt = false;
    heal = false;
    strike = false;
    item = false;
    num = -1;
    num2= -2;
    Grunt1 = new SoundFile (groupGame.this, "Player_hitV2.mp3");
    Grunt2 = new SoundFile (groupGame.this, "Player_hitV2.1.mp3");
    Grunt3 = new SoundFile (groupGame.this, "Player_hitV2.2.mp3");
    Ehit1 = new SoundFile (groupGame.this, "Enemy_hit1.mp3");
    Ehit2 = new SoundFile (groupGame.this, "Enemy_hit2");
    Ehit3 = new SoundFile (groupGame.this, "Enemy_hit3");
  }

  void playSound() {
    //if (start) {
    //BackgroundMusic.play();
    //} else {
    //BackgroundMusic.stop();
    //}

    if (hurt) {
      num = int(random(1, 3));
    } else if (num == 1) {
      Grunt1.play();
    } else if (num == 2) {
      Grunt2.play();
    } else if (num == 3) {
      Grunt3.play();
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
    } else if (num2 == 1) {
      Ehit1.play();
    } else if (num2 == 2) {
      Ehit2.play();
    } else if (num2 == 3) {
      Ehit3.play();
    } else {
      num2 = -2;
      strike = false;
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
    //Room.play();
    //} else {
    //Room.stop();
    //}
  }
}
