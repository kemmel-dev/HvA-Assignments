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
void setup()
{
  textSize(30);
  size(1920, 1080);
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
void draw()
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
void drawMiddle()
{
  for (float y = SIZE_Y / 32; y <= SIZE_Y; y += SIZE_Y / 8)
  {
    rect(HALF_X - SIZE_X / 128, y, SIZE_X / 64, SIZE_Y / 16);
  }
}

// Moves the paddles up or down depending on whether the inputs are pressed
void movePaddles()
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
void displayObjects()
{
  paddleOne.display();
  paddleTwo.display();
  ball.display();
  scores.update();
}

// --- CHANGE PLAYER CONTROLS HERE ---
// Stores the pressed-state of a key if it's a case we care about.
boolean isKeyDown(char k, boolean isDown)
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

void checkScore()
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

void delayNextFrame()
{
  delayNextFrame = true;
}

// Returns which player scored. 
// Returns 0 if noone scored.
int score()
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
void keyPressed()
{
  isKeyDown(key, true);
}

// Called whenever a key is released, and stores the pressed-state of that key.
void keyReleased()
{
  isKeyDown(key, false);
}

int hitTimer = 0;

// Checks whether the ball hit something, and call corresponding function.
void checkForHits()
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

void reverseVelocityX()
{
  ball.v_x *= -1;
}


void reverseVelocityY()
{
  ball.v_y *= -1;
}
