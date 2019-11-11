
// Treat as constants, these define the size of our sketch
final static int SIZE_X = 1920;
final static int SIZE_Y = 1080;

// Store whether the left or right movement key is pressed down
Boolean leftDown = false;
Boolean rightDown = false;

// Defines what speed bullets travel at
final int BULLET_SPEED = SIZE_Y / 60;

// The player object
Player player;

// 2d-array of invader objects
Invader[][] invaderGrid = new Invader[6][6];

// Dynamic list of bullets on screen
ArrayList<Bullet> bulletList;

// Is game over?
Boolean gameOver = false;

// Holds the graphics for our invaders and ship
PImage invaderGraphic;
PImage shipGraphic;

// Speeds the invaders move at
int invadersSpeed, invadersSpeedX, invadersSpeedY;
// Bounds the invaders can move within before changing directions
int invaderBoundLeft, invaderBoundRight, invaderBoundY;

int numInvadersAlive;

// Setup the screen size
void settings()
{
    size(SIZE_X, SIZE_Y);
}

// Setup drawing modes and initialize objects
void setup()
{
    imageMode(CENTER);
    rectMode(CENTER);
    textAlign(CENTER);
    textSize(SIZE_Y / 50);
    initGraphics();  
    newGame();
}

// Initializes the graphic objects
void initGraphics()
{
    invaderGraphic = loadImage("enemy.png");
    invaderGraphic.resize(SIZE_X / 25, 0);
    shipGraphic = loadImage("ship.png");
    shipGraphic.resize(SIZE_X / 25, 0);
}

void newGame()
{
    if (bulletList != null)
    {
        clearBulletList();
    }
    bulletList = new ArrayList<Bullet>();
    initInvaders();
    player = new Player();
}

void clearBulletList()
{
    for(int i = 0; i < bulletList.size(); i ++)
    {
        Bullet b = bulletList.get(i);
        b.x = SIZE_X;
        b.y = SIZE_Y;
    }
    bulletList = new ArrayList<Bullet>();
}

// Sets up the grid of Space Invaders and their corresponding variables
void initInvaders()
{
    // Calculate variables to create the grid
    int rows = invaderGrid[0].length;
    numInvadersAlive = rows * rows;
    int sizeGridX = (SIZE_X / 4) * 3;
    int sizeGridY = (SIZE_Y / 4) * 3;
    int xOffset = sizeGridX / 6;
    int yOffset = sizeGridY / 10;
    int xStart = SIZE_X / 12;
    int xPos = xStart;
    int yPos = SIZE_Y / 16;
    
    // Create the grid of invaders
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

    // Set Invaders' speeds and bounds
    invadersSpeed = 1;
    invadersSpeedX = invadersSpeed;
    invadersSpeedY = 0;

    invaderBoundLeft = SIZE_X / 16;
    invaderBoundRight = SIZE_X - invaderBoundLeft;
}

// Handles all actions for invader objects
void handleInvaders()
{
    // Get their current movement speed
    setMovementSpeedInvaders();
    for (Invader[] list : invaderGrid)
    {
        for (Invader i : list)
        {
            i.display();
            i.move(invadersSpeedX, invadersSpeedY);
        }
    }
}

Invader getLastInvader()
{
    int resultRow = 5;
    for(int rowY = resultRow; rowY >= 0; rowY--)
    {
        for(int rowX = 0; rowX < invaderGrid.length; rowX++)
        {
            Invader i = invaderGrid[rowX][rowY];
            if (i.alive)
            {
                return i;
            }
        }
    }
    return invaderGrid[0][0];
}

void isGameOver()
{
    Invader lastInvader = getLastInvader();
    if (lastInvader.y > player.y - shipGraphic.height / 2)
    {
        listenToInput = false;
        gameOver = true;
        return;
    }
    if (numInvadersAlive == 0)
    {
        listenToInput = false;
        gameOver = true;
        return;
    }
    return;
}

Boolean invadersOnRight = false;

void setMovementSpeedInvaders()
{
    Invader invaderLeft = invaderGrid[0][0];
    Invader invaderRight = invaderGrid[5][0];

    // Check right side
    if (invadersSpeedX > 0)
    {
        if (invaderRight.x > invaderBoundRight)
        {
            invadersOnRight = true;
            invadersSpeedX = 0;
            invadersSpeedY = invadersSpeed;
            invaderBoundY = invaderRight.y + SIZE_Y / 16;
        }
    }
    // Check left side
    else if (invadersSpeedX < 0)
    {
        if (invaderLeft.x < invaderBoundLeft)
        {
            invadersOnRight = false;
            invadersSpeedX = 0;
            invadersSpeedY = invadersSpeed;
            invaderBoundY = invaderRight.y + SIZE_Y / 16;
        }
    }
    // Check y
    else if (invadersSpeedX == 0)
    {
        if (invaderRight.y > invaderBoundY)
        {
            invadersSpeed += 1;
            invadersSpeedY += 1;
            if (invadersOnRight)
            {
                invadersSpeedX = -invadersSpeed;
            }
            else
            {
                invadersSpeedX = invadersSpeed;
            }
            invadersSpeedY = 0;
        }
    }
}

// Handles all actions for a bullet -- this includes killing invaders
void handleBullets()
{
    // Stores the indexes for each bullet that needs to be removed
    IntList indexList = new IntList();

    int bulletIndex = 0;
    for (Bullet b : bulletList)
    {
        // If bullet needs to be removed (is offscreen or hit a target)
        if (b.y < -10 || b.hit())
        {
            // Append it's index in indexList
            indexList.append(bulletIndex);
        }
        else 
        {
            // Move and show the bullet
            b.move();
            b.display();
        }
        bulletIndex++;
    }

    // Get the number of bullets that need to be removed
    int numBullets = indexList.size();

    // If we need to remove bullets
    if (numBullets > 0)
    {
        for (int j = 0; j < numBullets; j++)
        {
            int index = indexList.get(j);
            // Current bullet is b
            Bullet b = bulletList.get(index);
            // If b has hit a target
            if (b.target != null)
            {
                // Kill the target
                Invader invader = invaderGrid[b.target.i][b.target.j];
                invader.alive = false;
                numInvadersAlive -= 1;
            }
            // Delete the bullet
            bulletList.remove(index);
        }
    }

}

Boolean delayThisFrame = false;

// Called each time a new frame of our game is drawn
void draw()
{
    if (delayThisFrame)
    {
        delay(5000);
        delayThisFrame = false;
        newGame();
        gameOver = false;
        return;
    }
    if (gameOver)
    {
        listenToInput = false;
        delayThisFrame = true;
        background(0);
        text("Game Over!\nResetting game in 5 seconds", SIZE_X / 2, SIZE_Y / 2);
    }
    else 
    {
        listenToInput = true;
        background(0);
        player.move();
        player.display();
        handleInvaders();
        handleBullets();
        isGameOver();
    }
}

boolean listenToInput = true;

// Called whenever a key is pressed
void keyPressed()
{
    if (listenToInput)
    {
        switch(key)
        {
            case ' ':
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