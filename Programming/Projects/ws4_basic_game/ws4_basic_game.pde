import processing.sound.*; //importing the Sound library


// Global variables:
int points = 0;
int nBlts = 200;
int nEnemies = 10;

Player player;
Bullet bullet; 
Enemy[] enemy;

// Arrays of booleans for Keyboard handling. One boolean for each keyCode
final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];



// method "setup" is only called once
void setup() {  
  size(500, 500);
  imageMode(CENTER);  // draw images from center, not from the corner (default)

  // first, load all graphics & sounds
  loadAssets();

  //instantiate all objects (player, bullets, enemies...)
  player = new Player();

  bullet = new Bullet();  // Instanciate a specific bullet

  // We will have to create our enemies separately
  enemy = new Enemy[nEnemies];
  for (int i = 0; i < nEnemies; i++) {
    enemy[i] = new Enemy();
  }
}

// this method will update the entire gameworld
void updateGame() { 

  player.update();

   if (bullet.isActive) {
     bullet.update();
   }
  

  // We have to update each enemy separately
  for (int i = 0; i < nEnemies; i++) { 
    if (enemy[i].isActive) enemy[i].update();
  }
}

// this method draws the entire gameworld
void drawGame() { 
  background(0); // make it BLACK

  player.draw();
 
  if (bullet.isActive) bullet.draw(); // only draw bullet when it is active

  // Draw each enemy separately
  for (int i = 0; i < nEnemies; i++) {    
    if (enemy[i].isActive) enemy[i].draw(); // only draw when enemy is active
  }
  // Draw our score in the top left corner
  fill(color(255, 255, 255));
  text("Score:" + points, 220, 30);
}


//-------------------------------------------------------------- 
// Anything below this line can be considered 'boiler plate',
// you (almost) never have this edit this code...

//the Processing 'draw' method, which is being called 60 times/sec
void draw() {
  updateGame();
  drawGame();
}

/* keyPressed() is a Processing specific "callback" method that 
 gets called when a key is pressed. 
 Set the boolean at the index of "keyCode" to true
 */
void keyPressed() {
  //safety: if keycode exceeds tha maximum number, break off methhod ('return').
  if (keyCode >= KEY_LIMIT) return;

  keysPressed[keyCode] = true;
}
//..and at keyReleased() to false
void keyReleased() {
  if (keyCode >= KEY_LIMIT) return;

  keysPressed[keyCode] = false;
}
