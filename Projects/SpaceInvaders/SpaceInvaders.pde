
final static int SIZE_X = 1920;
final static int SIZE_Y = 1080;

Boolean leftDown = false;
Boolean rightDown = false;

final int BULLET_SPEED = SIZE_Y / 60;

Player player;
Invader[][] invaderGrid = new Invader[6][6];

ArrayList<Bullet> bulletList = new ArrayList<Bullet>();

PImage invaderGraphic;
PImage shipGraphic;

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
    player = new Player();
    invaderGraphic = loadImage("enemy.png");
    invaderGraphic.resize(SIZE_X / 25, 0);
    shipGraphic = loadImage("ship.png");
    shipGraphic.resize(SIZE_X / 25, 0);
    initInvaders();
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
            i.x += 
            i.display();
        }
    }
}

// Handles all actions for a bullet -- this includes killing invaders
void handleBullets()
{
    // Stores the indexes for each bullet that needs to be removed
    int i = 0;
    IntList indexList = new IntList();

    for (Bullet b : bulletList)
    {
        // If bullet needs to be removed
        // (offscreen or hit a target)
        if (b.y < -10 || b.hit())
        {
            // append it's index in indexList
            indexList.append(i);
        }
        else 
        {
            b.move();
            b.display();
        }
        i++;
    }

    // Get the number of bullets that need to be removed
    int numBullets = indexList.size();
    if (numBullets > 0)
    {
        for (int j = 0; j < numBullets; j++)
        {
            // If bullet needs to be removed because it hit a target,
            Hit target = bulletList.get(j).target;
            if (target.hit)
            {   
                // Kill the target
                invaderGrid[target.i][target.j].alive = false;
            }
            // Remove the bullet
            bulletList.remove(j);
        }
    }

}

// Called each time a new frame of our game is drawn
void draw()
{
    background(0);
    player.move();
    player.display();
    showInvaders();
    handleBullets();
}

// Called whenever a key is pressed
void keyPressed()
{
    switch(key)
    {
        case 'w':
            player.shoot();
            return;
        case 'a':
            leftDown = true;
            return;
        case 'd':
            rightDown = true;
            return;
        default:
            return;
    }
}

// Called whenever a key is released
void keyReleased()
{
    switch(key)
    {
        case 'a':
            leftDown = false;
            return;
        case 'd':
            rightDown = false;
            return;
        default:
            return;
    }
}