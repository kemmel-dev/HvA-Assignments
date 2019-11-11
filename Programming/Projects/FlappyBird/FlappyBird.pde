// A processing implementation of the popular mobile game
// 'Flappy Bird' for HvA's Programming Course.
// This game is designed for a 9:16 aspect ratio (vertical window)

final static int SIZE_X = 1080;
final static int SIZE_Y = 1920;

Foreground foreground = new Foreground();
Backdrop backdrop = new Backdrop();
Scoreboard scoreboard = new Scoreboard();

final static int FRAME_RATE = 60;

final static int MOVE_SPEED_X = (SIZE_X / 3) /  FRAME_RATE;

Boolean onRight = false;

static Boolean gameOver = true;

// Set up the size the sketch run at
void settings()
{
    size(SIZE_X, SIZE_Y);
}

// Gets called after settings(), once on launch
// before the first iteration of draw()
void setup()
{
    // Set the frame rate and draw modes
    frameRate(FRAME_RATE);
    rectMode(CENTER);
    ellipseMode(CENTER);
    textAlign(CENTER);
    textSize(SIZE_Y / 25);
    foreground.SpawnPipes();
}

// Gets called each time we draw a new frame
void draw()
{
    if (onRight == false)
    {
        surface.setLocation(int(SIZE_X * 2.5),0);
        onRight = true;
    }
    backdrop.Display();
    foreground.Display();
    scoreboard.Display();

}

void onGameOver()
{
    scoreboard.SaveHighScore();
    scoreboard.score = 0;
    gameOver = true;
    foreground = new Foreground();
    foreground.SpawnPipes();
}

// Gets called when the mouse has been pressed
void mousePressed()
{
    // Send the input to foreground
    foreground.mousePressed();
}