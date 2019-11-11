class Enemy {

  // Properties of an Enemy. i.e.: an Enemy has:
  float x, y;       // a position
  float vx, vy;     // a velocity (direction)
  float diameter;   // a size
  boolean isActive;
  boolean gotHit;
  int hp;

  final color FILLCOLOR = color(255, 0, 0);  // normal color
  final color HITCOLOR = color(255, 255, 200);  // 'I got hit' color



  // The init method can be called to set an enemy to its default state
  Enemy() {
    // The size of an enemy varies
    diameter = random(50)+20;

    // the position of the enemy is randomly chosen to fit within the window 
    x = random(diameter / 2, width - diameter / 2);    
    y = random(diameter / 2, height - diameter / 2);

    // The velocity and the direction of the enemy is randomly chosen
    vx = random(-1.0, 1.0);
    vy = random(-1.0, 1.0);

    // a boolean, for checking/setting if this enemy is active or not
    isActive = true;
    hp = 10;
  }

  // Whenever you want to update an enemy, call this method
  void update() {
    if (!isActive) return; // if enemy is NOT active: break off (return) this method.

    // use the velocity to calculate the new position
    x += vx;
    y += vy;

    // Detect wether the enemy bounces against the edges of the window
    // and change the direction if they do
    if ((x > width-diameter/2) || (x < diameter/2)) {
      vx = -vx;
    }
    if ((y > height-diameter/2) || (y < diameter/2)) {
      vy = -vy;
    }

    //after enemy has moved, check collisions of enemy-vs-player
    if (overlapsPlayer()) {
      // TODO: code when enemy hits player

    }

    //TODO: check collisions of enemy-vs-bullet AND adjust score...

  }



  // Whenever you want to draw the enemy, call this method
  void draw() {
      if (gotHit) {     
        fill(HITCOLOR);
        gotHit = false;
      } else {
        fill(FILLCOLOR);
      }

      ellipse(x, y, diameter, diameter);
  }

  // Use this method to check wether a player overlaps with the enemy
  boolean overlapsPlayer() {
    // Calculate the distance between the player and an enemy
    float a = x-player.x, // horizontal distance between player and enemy
      b = y-player.y, // vertical distance between player and enemy
      c = sqrt(a*a + b*b); // diagonal distance between player and enemy
    // if distance < radii combined, they overlap
    return c < (diameter/2 + player.diameter/2);
  }
  
}
