class Bullet {
  // Properties of a Bullet. i.e.: a Bullet HAS:
  float x, y;     // a position
  float vx, vy;   // a velocity (direction)
  float diameter;  // a size
  boolean isActive;// a way to see if it is being fired

  // The Constructor, to set initial values, etc
  Bullet() {
    // A bullet is small
    diameter = 15;
    reset();
  }
  
  void reset() {
    // the bullet is not being fired right now
    isActive = false;
    // a bullets starts outside the window when it is not being fired 
    x = -1000;    
    y = -1000;

    // The bullet starts out with 0 velocity
    vx = 0;
    vy = 0;  
  }
  

  // Whenever you want to update a bullet, call this method
  void update() {
    // if the bullet is being fired
    if (isActive) {     
      // if the bullet runs out of our window, return it to its initial state
      if (y < 0) reset();
      
       // use the velocity to calculate the new position
      x += vx;
      y += vy;
    }   
  }

  // Whenever you want to draw the bullet, call this method
  void draw() {
    image(bulletImg, x, y);
  }

  // Call this method to signify that the bullet has been fired
  void fire(float angle, float speed) {   
    isActive = true;
    // Start the bullet at the player position
    x = player.x;
    y = player.y;
    // the vertical velocity is 10
    vx = speed * sin(angle);
    vy = speed * -cos(angle);
   
  }

  
}
