// Declaring Graphics
PImage bulletImg, playerImg;

// Declaring Sounds
SoundFile laserSound;


public void loadAssets() {

  // Load all graphics
  bulletImg = loadImage("./sprites/plasmabolt.png");
  playerImg = loadImage("./sprites/player_ship.png");
  
  // Load all sounds 
  laserSound = new SoundFile(this, "./sounds/laser9.wav");

 
}
