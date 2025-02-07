import processing.sound.*;

class SoundEffects {
  boolean start;
  boolean hurt;
  boolean heal;
  boolean strike;
  boolean item;
  boolean walking;
  boolean room;
  SoundFile Hit;
  SoundFile Healing;
  SoundFile BackgroundMusic;
  SoundFile Attack;
  SoundFile Cheer;
  SoundFile Walking;
  SoundFile Room;

  SoundEffects() {
    start = false;
    hurt = false;
    heal = false;
    strike = false;
    item = false;
    walking = false;
    room = false;
    //Hit =
    //Healing =
    //BackgroundMusic =
    //Attack =
    //Cheer =
    // Walking =
    // Room =
  }

  void display() {
    if (start) {
      BackgroundMusic.play();
    } else {
      BackgroundMusic.stop();
    }

    if (hurt) {
      Hit.play();
    } else {
      Hit.stop();
    }

    if (heal) {
      Healing.play();
    } else {
      Healing.stop();
    }

    if (strike) {
      Attack.play();
    } else {
      Attack.stop();
    }

    if (item) {
      Cheer.play();
    } else {
      Cheer.stop();
    }

    if (walking) {
      Walking.play();
    } else {
      Walking.stop();
    }

    if (room) {
      Room.play();
    } else {
      Room.stop();
    }
  }
}
