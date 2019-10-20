
// Treat these as constants, represent the size of the sketch
final int SIZE_X = 1920 / 2;
final int SIZE_Y = 1080 / 2;
final int PLAYER_WIDTH = SIZE_X / 20;

Player player;

color[] fruityColors = { color(228,255,85),
                         color(147,255,104),
                         color(255,181,67),
                         color(255,90,90),
                         color(198,96,255),
                         color(144,12,63)    };



void settings()
{
    size(SIZE_X, SIZE_Y);
}

// Called before the first iteration of draw();
void setup()
{
    frameRate(50);
    imageMode(CENTER);
    player = new Player(SIZE_X / 2, SIZE_Y - PLAYER_WIDTH);
}

// Draws every frame of our game
void draw()
{
    background(0);
    fill(fruityColors[int(random(0, fruityColors.length))]);
    circle(SIZE_X / 2, SIZE_Y / 2, 100);
    player.controller.move();
    player.draw();
    
}

void keyPressed()
{
    player.controller.keyPressed();
}

void keyReleased()
{
    player.controller.keyReleased();
}