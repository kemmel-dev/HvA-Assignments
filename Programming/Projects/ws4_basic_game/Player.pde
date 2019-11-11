class Player {
  //Properties of the Player
  //i.e.: The player has:

  float x, y; // position 
  float vx, vy; // velocity (also direction)
  float diameter; // a size

  final float SPEED = 5; 
  int bltCounter = 0;

  int cooldown;


  // The init method can be called to set a player to it's default state
  Player() {
    diameter = 20;
    reset();
  }

  void reset() {
    // The player spawns horizontally in the center    
    x = width/2; 
    // The player spawns vertically at the bottom of the screen
    y = height-diameter/2;
    // no default velocity or direction    
    vx = 0;
    vy = 0;
  }

  // The update method is called whenever we want to calculate the new position of a player
  // based on the keyboard input
  void update() {
    vx *= 0.9; // our player-object will move a bit slower every frame

    // Velocity is changed when arrow keys are pressed 
    if (keysPressed[LEFT]) vx = -1;
    if (keysPressed[RIGHT]) vx = 1;



    if (keysPressed[90] && cooldown == 0) { // keyCode 90 is 'z' key
      cooldown = 10; // set 'cooldown' to 10 frames for the weapon
     
      // TODO: play sound when shooting.
      
      //TODO: make some 'counting' system to enable multiple bullets in the screen
      bullet.fire(0, 8);
    }

    if (cooldown > 0) cooldown--;
    // Update our position using the velocity
    x += vx * SPEED;
    y += vy * SPEED;
    //constrain x-value between screen size and 0
    x = constrain(x, 0, width-diameter/2);
  }


  //Call the draw method to draw the player
  void draw() {
    image(playerImg, x, y);
  }
}
