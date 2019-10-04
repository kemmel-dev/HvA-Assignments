// A processing implementation of the popular mobile game
// 'Flappy Bird' for HvA's Programming Course.
// This game is designed for a 9:16 aspect ratio (vertical window)


Backdrop backdrop = new Backdrop();

final static int SIZE_X = 1080;
final static int SIZE_Y = 1920;

final static int FRAME_RATE = 30;

final static int MOVE_SPEED_X = (SIZE_X / 3) /  FRAME_RATE;

Boolean onRight = false;

void settings()
{
    size(SIZE_X, SIZE_Y);
}

void setup()
{
    frameRate(FRAME_RATE);
    rectMode(CENTER);
    ellipseMode(CENTER);
}

// Gets called to draw every single frame of our game.
void draw()
{
    if (onRight == false)
    {
        surface.setLocation(int(SIZE_X * 2.5),0);
        onRight = true;
    }
    backdrop.Display();
}