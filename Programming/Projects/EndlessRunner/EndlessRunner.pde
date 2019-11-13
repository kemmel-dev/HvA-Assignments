// * --------------------------------------------------------------* 
// This is an implementation of an "Endless Runner" game.
// The player controls a circle using the keyboard.
// From the top of the screen obstacles will appear which the player
// will have to dodge. The speed at which the obstacles fall down,
// which we will call the obstacle speed, will gradually increase. 
// When the player hits an obstacle, the obstacle speed resets and the
// player loses points.
// This program was made as an exam for HvA's Programming Course in 
// under 100 minutes.
// 
// (By Kamiel de Visser (Student no. 500838438))
// Note: The game is controlled with 'a' for left and 'd' for right
//       (this could be changed to the keycodes for left and
//        right arrows, but I didn't have the keycodes available)
// * --------------------------------------------------------------* 

// Treated as constants
final private int OBSTACLE_SPEED_DEFAULT = 1;
final private float OBSTACLE_SPEED_INCREMENT = 0.005;

// Holds our obstacle objects
private Obstacle[] obstacleArray = new Obstacle[20];

// Represent the size bounds for obstacles.
private int obstacleSizeMin = 30;
private int obstacleSizeMax = 50;

// Represents the speed at which obstacles drop down at
private float obstacleSpeed = OBSTACLE_SPEED_DEFAULT;

// Hold the score the player currently has
private long score = 0;

// Object that represents the player.
private Player player;

private int playerOffsetFromBottom = 100;

// These hold whether the right or left key is currently held down.
protected Boolean rightDown = false;
protected Boolean leftDown = false;

// Styling options:
private color backgroundColor = 0;
private color obstacleColor = 255;
private color playerColor = color(255, 255, 0);
private color scoreFontColor = 127;
private int scoreFontSize = 40;

// Ran once before the first iteration of draw();
void setup()
{
  // Set the window size
  size(400, 600);
  // Initialize the obstacle array
  initObstacles();
  // Create a player in the lower middle of the screen
  player = new Player(new PVector(width / 2, height - playerOffsetFromBottom), 20);
  
  // Set how we want to style our score text
  textSize(scoreFontSize);
  textAlign(CENTER);
}

// Gets a random X value between 0 and the size of the sketch.
public float getRandomXValue()
{
  return random(0, width + 1);
}

// Initializes the array with 20 obstacle objects.
void initObstacles()
{
  // For all obstacles...
  for (int i = 0; i < obstacleArray.length; i++)
  {
    // Give obstacle a random spawn position
    int yUpperBound = -700;
    float randX = getRandomXValue();
    float randY = random(yUpperBound, 0 + 1);
    PVector randPos = new PVector(randX, randY);
    
    // Give obstacle a random size
    int randSize = int(random(obstacleSizeMin, obstacleSizeMax + 1));
    
    // Populate the array with this new obstacle
    obstacleArray[i] = new Obstacle(randPos, randSize);
  }
}
 
// Gets called to draw each frame of our game
void draw()
{ //<>//
  background(backgroundColor);
  
  // Move and display the player
  fill(playerColor);
  player.move();
  player.display();
  
  // Move and display the obstacles, then test for overlap
  fill(obstacleColor);
  
  for (int i = 0; i < obstacleArray.length; i++)
  {
    Obstacle o = obstacleArray[i];
    o.move(obstacleSpeed);
    o.display();
    obstacleOverlapsPlayer(i);
  }
  
  // Display score
  fill(scoreFontColor);
  text(String.format("Score: %d", score), width / 2, height / 4);
  
  // Increment obstacle speed and score
  obstacleSpeed += OBSTACLE_SPEED_INCREMENT;
  score ++;
}

// Checks whether the obstacle at ballIndex overlaps the player's current
// position.
// Returns true and calls PunishPlayer() if true;
// Returns false otherwise.
boolean obstacleOverlapsPlayer(int ballIndex)
{
  Obstacle o = obstacleArray[ballIndex];
  
  float dist = dist(player.pos.x, player.pos.y, o.pos.x, o.pos.y);
  if (dist <= o.r + player.r)
  {
    enforcePenalty();
    return true;
  }
  return false;
}

// Enforces a penalty on the player, which consists of lowering
// their score by a hundred and resetting the speed at which 
// obstacles move.
void enforcePenalty()
{
    // Lower the score, but not lower than 0
    score -= 100;
    if (score < 0)
    {
      score = 0;
    }
    // Reset the obstacle speed to it's default value.
    obstacleSpeed = OBSTACLE_SPEED_DEFAULT;
}

// Called whenever a key is pressed down
// Sets the respective boolean to true.
void keyPressed()
{
  if (key == 'a' || key == 'A')
  {
    leftDown = true;
    return;
  }
  if (key == 'd' || key == 'D')
  {
    rightDown = true;
    return;
  }
}

// Called whenever a key is released.
// Sets the respective boolean to false.
void keyReleased()
{
  if (key == 'a' || key == 'A')
  {
    leftDown = false;
    return;
  }
  if (key == 'd' || key == 'D')
  {
    rightDown = false;
    return;
  }
}

// Represents an Obstacle object.
// Obstacles consist of circles with a position and a size.
class Obstacle
{
  PVector pos;
  int d;
  float r;
  
  Obstacle(PVector _pos, int _d)
  {
    pos = _pos;
    d = _d;
    r = d / 2;
  }
  
  // Displays the obstacle
  void display()
  {
    circle(pos.x, pos.y, d);
  }
  
  // Moves the obstacle downwards.
  // Also resets it's position to above the screen if 
  // the obstacle falls below the screen.
  void move(float distanceDown)
  {
    pos.y += distanceDown;
    
    if (pos.y > height + r)
    {
      int boundY = -100;
      pos = new PVector(getRandomXValue(), boundY);
    }
  }
}

// Represents a Player object.
// Players are represented by a Circle and have a size and a position.
// They can be moved left and right by holding down movement keys.
class Player
{
  PVector pos;
  int d;
  float r;
  float v = 2;
  
  Player(PVector _pos, int _d)
  {
    pos = _pos;
    d = _d;
    r = d / 2;
  }
  
  // Displays the player.
  void display()
  {
    circle(pos.x, pos.y, d);
  }
  
  // Moves the player if movement keys are held down.
  void move()
  {
    // leftDown and rightDown are bools in EndlessRunner.pde which represent
    // whether the left or right movement key is held down
    if (leftDown)
    {
      // Constrain the plater between the X bounds of our playing field.
      pos.x = constrain(pos.x - v, r, width - r);
    }
    if (rightDown)
    {
      // Constrain the plater between the X bounds of our playing field.
      pos.x = constrain(pos.x + v, r, width - r);
    }
  }
}
