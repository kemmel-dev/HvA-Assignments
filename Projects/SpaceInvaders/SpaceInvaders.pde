
final static int SIZE_X = 1920;
final static int SIZE_Y = 1080;

final int BULLET_SPEED = SIZE_Y / 60;

Player player;
Invader[][] invaderGrid = new Invader[6][6];

ArrayList<Bullet> bulletList = new ArrayList<Bullet>();

// Setup the screen size
void settings()
{
    size(SIZE_X, SIZE_Y);
}

// setup drawing modes and initialize objects
void setup()
{
    imageMode(CENTER);
    rectMode(CENTER);
    initInvaders();
    player = new Player();
}

// Sets up the grid of Space Invaders
void initInvaders()
{
    int rows = invaderGrid[0].length;
    int sizeGridX = (SIZE_X / 4) * 3;
    int sizeGridY = (SIZE_Y / 4) * 3;

    int xOffset = sizeGridX / 6;
    int yOffset = sizeGridY / 10;

    int xStart = SIZE_X / 6;
    int xPos = xStart;
    int yPos = SIZE_Y / 16;

    
    for (int y = 0; y < rows; y++)
    {
        for (int x = 0; x < rows; x++)
        {
            invaderGrid[x][y] = new Invader(xPos, yPos);
            xPos += xOffset; 
        }
        xPos = xStart;
        yPos += yOffset;
    }
}

// Shows the invaders
void showInvaders()
{
    for (Invader[] list : invaderGrid)
    {
        for (Invader i : list)
        {
            i.display();
        }
    }
}

// Handles all actions for a bullet
void handleBullets()
{
    for (Bullet b : bulletList)
    {
        b.move();
        b.display();
    }
}

// Called each time a new frame of our game is drawn
void draw()
{
    background(0);
    player.display();
    handleBullets();
}

// Called whenever a key is pressed
void keyPressed()
{
    // test
    if (key == 'a')
    {
        player.shoot();
    }
}