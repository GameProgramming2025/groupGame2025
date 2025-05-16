import ddf.minim.*;
import ddf.minim.AudioPlayer;


class SoundEffects {
  boolean background; //background music
  boolean hurt;
  boolean heal;
  boolean strike;
  boolean item;  // Pickup item
  boolean attack;
  //boolean walking; // walking sfx
  boolean explosion; // enemies explosion sfx
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
  AudioPlayer backgrn;
  AudioPlayer itemfound;
  AudioPlayer boom;


  SoundEffects(Minim m) {
    hurt = false;
    //heal = false;
    strike = false;
    attack = false;
    item = false;
    explosion = false;
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
    backgrn = minim.loadFile ("Data/SoundEffects/backgroundmusic.mp3");
    itemfound = minim.loadFile ("Data/SoundEffects/itemfound.mp3");
    boom = minim.loadFile ("Data/SoundEffects/explosion.mp3");
  }


  void update() {
    if (background){
      if(!backgrn.isPlaying()){
       backgrn.play(0);
      }else{
       backgrn.pause(); 
      }
    }
    
    if (item){
     if(!itemfound.isPlaying()){
     itemfound.play(0);
     item = false;
     } else {
      itemfound.pause(); 
     }
    }
    
    
    if (hurt) {
      //println(num);
      num = (int)random(1, 3);
      if (num == 1) {
        if (!grunt1.isPlaying()) {
          grunt1.play(0);
          hurt = false;
        }
      }
      if (num == 2) {
        if (!grunt2.isPlaying()) {
          grunt2.play(0);
          hurt = false;
        }
      }
      if (num == 3) {
        if (!grunt3.isPlaying()) {
          grunt3.play(0);
          hurt = false;
        }
      }
    }

    if (strike) {
      num2 = (int)random(1, 3);
      println(num2);
      
      if (num2 == 1) {
        if (!ehit1.isPlaying()) {
          ehit1.play(0);
          strike = false;
        }
      }
      
      if (num2 == 2) {
        if (!ehit2.isPlaying()) {
          ehit2.play(0);
          strike = false;
        }
      }
      
      if (num2 == 3) {
        if (!ehit3.isPlaying()) {
          ehit3.play(0);
          strike = false;
        }
      }
    }

    if (attack) {
      if ( !fireball.isPlaying() ) {
        fireball.play(0);
        attack = false;
      }
    }
    
    if (explosion){
     if(!boom.isPlaying() ) {
      boom.play(0);
      explosion = false;
     } else{
      boom.pause(); 
     }
    }
    
    
  }
}
