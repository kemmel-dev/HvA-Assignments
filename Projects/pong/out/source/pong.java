import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class pong extends PApplet {

// 'Constant' values
float SIZE_X = 1920;
float SIZE_Y = 1080;
float HALF_X = SIZE_X / 2;
float HALF_Y = SIZE_Y / 2;

// Player control keys are set in the isKeyDown() method.

// We need two paddles and a ball.
Paddle paddleOne, paddleTwo;
Ball ball;

// We also need to remember the player's scores.
Scores scores;

// Stores whether the players keys are pressed down
Boolean p1Down = false, p1Up = false, p2Down = false, p2Up = false;
// Stores whether we have to delay this frame or not
Boolean delayNextFrame = false;
// Setup the canvas and create paddle and ball objects.
public void setup()
{
  textSize(30);
  
  frameRate(50);
  // Creates a scores object that displays our players' scores in plaintext
  scores = new Scores(SIZE_X / 16, SIZE_X - (SIZE_X / 16), SIZE_Y / 16);

  float xSixteenth = SIZE_X / 16;
  float ySixteenth = SIZE_Y / 16;
  float paddleHeight = SIZE_Y / 4;
  float paddleWidth = SIZE_X / 64;
  float y_start = HALF_Y - paddleHeight / 2;

  // Creates two paddle objects
  paddleOne = new Paddle(xSixteenth - paddleWidth, y_start, paddleWidth, paddleHeight, false);
  paddleTwo = new Paddle(SIZE_X - xSixteenth, y_start, paddleWidth, paddleHeight, true);
  
  // Creates a ball object
  ball = new Ball(HALF_X, HALF_Y, ySixteenth);

  // We want to draw no shapes with strokes, so we turn that off.
  noStroke();
}


// Called each frame, draws our game
public void draw()
{
  // Delay this frame? (Upon new round)
  if (delayNextFrame)
  {
    delay(2000);
    delayNextFrame = false;
  }

  // Set up our background for the game
  background(0);
  drawMiddle();

  // Move the paddles and ball
  movePaddles();
  ball.move();

  // Then check whether they hit
  checkForHits();

  checkScore();
  scores.update();

  // Display them
  displayObjects();
  fill(125);
  rect(ball.x, ball.y, 1, 1);
  fill(255);
}

// Draws the dotted line across the middle of our field
public void drawMiddle()
{
  for (float y = SIZE_Y / 32; y <= SIZE_Y; y += SIZE_Y / 8)
  {
    rect(HALF_X - SIZE_X / 128, y, SIZE_X / 64, SIZE_Y / 16);
  }
}



// Moves the paddles up or down depending on whether the inputs are pressed
public void movePaddles()
{
  if (p1Up)
  {
    paddleOne.moveUp();
  }
  if (p1Down)
  {
    paddleOne.moveDown();
  }
  if (p2Up)
  {
    paddleTwo.moveUp();
  }
  if (p2Down)
  {
    paddleTwo.moveDown();
  }
}

// Displays the following objects
public void displayObjects()
{
  paddleOne.display();
  paddleTwo.display();
  ball.display();
  scores.update();
}

// --- CHANGE PLAYER CONTROLS HERE ---
// Stores the pressed-state of a key if it's a case we care about.
public boolean isKeyDown(char k, boolean isDown)
{
  switch(k)
  {
    case 's':
      return p1Down = isDown;
    case 'w':
      return p1Up = isDown;
    case 'k':
      return p2Down = isDown;
    case 'i':
      return p2Up = isDown;
    default:
      return isDown;
  }
}

public void checkScore()
{
  int score = score();
  switch(score)
  {
    // Noone scores
    case 0:
      return;
    // Player one scores
    case 1:
      scores.addPointTo(1);
      ball.reset(2);
      paddleOne.reset();
      paddleTwo.reset();
      delayNextFrame();
      return;
    // Player two scores
    case 2:
      scores.addPointTo(2);
      ball.reset(1);
      paddleOne.reset();
      paddleTwo.reset();
      delayNextFrame();
      return;
  }
}

public void delayNextFrame()
{
  delayNextFrame = true;
}

// Returns which player scored. 
// Returns 0 if noone scored.
public int score()
{
  if (ball.x > SIZE_X)
  {
    return 1;
  }
  else if (ball.x < 0)
  {
    return 2;
  }
  return 0;
}

// Called whenever a key is pressed, and stores the pressed-state of that key.
public void keyPressed()
{
  isKeyDown(key, true);
}

// Called whenever a key is released, and stores the pressed-state of that key.
public void keyReleased()
{
  isKeyDown(key, false);
}

int hitTimer = 0;

// Checks whether the ball hit something, and call corresponding function.
public void checkForHits()
{
  // Check for y-bounds
  if (ball.y_bottom >= SIZE_Y)
  {
    reverseVelocityY();
  }
  else if (ball.y_top <= 0)
  {
    reverseVelocityY();
  }
  
  if (hitTimer > 4)
  {
    if (ball.y_bottom >= paddleTwo.top && ball.y_top <= paddleTwo.bottom)
    {
      if ((ball.x_right >= paddleTwo.hitCoordX))
      {
        reverseVelocityX();
      }
    }
    hitTimer = 0;
  }
  hitTimer++;
}

public void reverseVelocityX()
{
  ball.v_x *= -1;
}


public void reverseVelocityY()
{
  ball.v_y *= -1;
}
// Defines what a ball is and can do.
class Ball
{
  // x/y pos, width, radius
  float x, y, w, r;
  // velocity
  float v_x = SIZE_X / 100;
  float v_y = v_x;

  // Coordinates of the ball's bounds
  float x_left;
  float x_right;
  float y_top;
  float y_bottom;
  
  Boolean passed = false;

  Ball(float _x, float _y, float _w)
  {
    x = _x;
    y = _y;
    w = _w;
    r = w / 2;
    x_left = x - r;
    x_right = x + r;
    y_top = y - r;
    y_bottom = y + r;
  }

  public void move()
  {
    x += v_x;
    x_left = x - r;
    x_right = x + r;
    y += v_y;
    y_top = y - r;
    y_bottom = y + r;
  }

  public void display()
  {
    ellipse(x, y, w, w);
  }
  
  // Reset the ball to the starting position for player 1 or 2.
  public void reset(int playerNo)
  {
    if (playerNo == 1)
    {
      ball.x = SIZE_X / 4;
      ball.y = HALF_Y;
      ball.v_x = - SIZE_X / 100;
      ball.v_y = 0;
    }
    else if (playerNo == 2)
    {
      ball.x = (SIZE_X / 4) * 3;
      ball.y = HALF_Y;
      ball.v_x = SIZE_X / 100;
      ball.v_y = 0;
    }
  }
}
// Defines what a paddle is and can do.
class Paddle
{
  float x, y, w, h;
  float ox, oy;
  boolean hitOnLeft;

  float hitCoordX;
  float top;
  float bottom;

  Paddle(float _x, float _y, float _w, float _h, boolean _hitOnLeft)
  {
    x = _x;
    ox = x;
    y = _y;
    oy = y;
    w = _w;
    h = _h;
    hitOnLeft = _hitOnLeft;
    // Set hit coordinate to left or right side of paddle
    hitCoordX = (hitOnLeft) ? x : x + w;
    top = y;
    bottom = y + h;
  }

  public void display()
  {
    rect(x, y, w, h);
  }

  // Move this paddle up, but not out of the canvas.
  public void moveUp()
  {
    if (y >= 10)
    {
      y -= 10;
      top -= 10;
      bottom -= 10;
    }
  }

  // Move this paddle down, but not out of the canvas.
  public void moveDown()
  {
    if (y <= SIZE_Y - h - 10)
    {
      y += 10;
      top += 10;
      bottom += 10;
    }
  }

  // Checks whether this paddle has currently hit a ball
  public Boolean hit(Ball ball)
  {    
    // If paddle is hit on left, concerns the right paddle
    if (hitOnLeft)
    {
      if (!ball.passed)
      {
        if (((ball.x_right >= paddleTwo.hitCoordX && ball.y_top <= paddleTwo.bottom) && ball.y_bottom >= paddleTwo.top))
        {
          ball.passed = true;
          return true;
        }
      }
      return false;
    }
    // Otherwise, concerns the left paddle
    else
    {
      if (!ball.passed)
      {
        if (((ball.x_left <= paddleOne.hitCoordX && ball.y_top <= paddleOne.bottom) && ball.y_bottom >= paddleOne.top))
        {
          ball.passed = true;
          return true;
        }
      }
      return false;
    }
  }
  public void reset()
  {
    x = ox;
    y = oy;
    top = y;
    bottom = y + h;
  }
}
class Scores
{
  int scoreP1, scoreP2;
  float x1, x2, y;
  
  Scores(float _x1, float _x2, float _y)
  {
    scoreP1 = 0;
    scoreP2 = 0;
    x1 = _x1;
    x2 = _x2;
    y = _y;
  }
  
  public void addPointTo(int playerNo)
  {
    if (playerNo == 1)
    {
      scoreP1 += 1;
    }
    else if (playerNo == 2)
    {
      scoreP2 += 1;
    }
  }
  
  public void update()
  {
    fill(255);
    text(scoreP1, x1, y);
    text(scoreP2, x2, y);
  }
}
  public void settings() {  size(1920, 1080); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "pong" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
