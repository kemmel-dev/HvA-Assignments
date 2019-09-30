// A Processing implementation of Agar.io for HvA's Programming Course.
// Player controls a red circle with the mouse.
// You can eat other circles if they're smaller than you by moving over them.
// If they're bigger, you're eaten instead.
// Try to become the biggest circle.
// 
// This project was done in under 100 minutes.
// By Kamiel de Visser, 500838438

// The amount of enemy circles.
int amountOfCircles = 20;
// Circle objects for our player and enemies
static Circle player;
Circle[] circles = new Circle[amountOfCircles];

Style style = new Style();

// These need to match up with the resolution you play at.
final static int SIZE_X = 800;
final static int SIZE_Y = 600;

// 
Boolean delayFrame = false;
int delayTime = 5000;

// Gets called before the first iteration of draw()
void setup()
{
    // Set the sketch size 
    // These have to be magic numbers but match with SIZE_X and SIZE_Y
    size(800,600);
    // Ensure we draw all circles and text with the x and y positions at their center
    ellipseMode(CENTER);
    textAlign(CENTER);

    createPlayer();
    createEnemies();
}

// Keeps drawing each frame of our game after setup() has finished.
void draw()
{
    // Fill with backgroundcolor
    background(style.backgroundColor);
    // Check whether this frame needs a delay
    if (delayFrame)
    {
        delay(delayTime);
        delayFrame = false;
    }
    // if game is in progress
    if (player.r > 0 && player.r < SIZE_Y)
    {
        CheckMovement();
        HandlePlayers();
    }
    // player must have won
    else if (player.r > SIZE_Y)
    {
        DrawEndScreen(1);
        NewGame();
    }
    // player must have lost
    else 
    {
        DrawEndScreen(2);
        NewGame();
    }
}


// Calls the functions needed to start a new game
void NewGame()
{
    createPlayer();
    createEnemies();
}

// Creates the Circle object which the player will be controlling
void createPlayer()
{
    int playerRadius = 30;
    player = new Circle();
    player.x = SIZE_X / 2;
    player.y = SIZE_Y / 2;
    player.r = 50;
    player.d = 2 * player.r;
    //                         R  G  B
    player.fillColor = color(255, 0, 0);
}

// Creates the Circle objects in circles[] which will be the enemies.
void createEnemies()
{    
    int j = 0;
    int errorLoops = 300;
    for (int i = 0; i < amountOfCircles; i++)
    {
        circles[i] = new Circle();
        // If circle overlaps the player's start circle, 
        // overwrite that circle with a new random circle
        while (circles[i].circlePlayerOverlap() && j < errorLoops)
        {
            circles[i] = new Circle();
            // Also prevent inf. while loop in case of extremely bad luck creating the circles.
            j++;
        }
        j = 0;
    }
}

// Draws either a win (type 1) or loss (type 2) screen
void DrawEndScreen(int type)
{
    fill(style.textColor);
    String s = "";
    if (type == 1)
        s = "You won!\nResetting game in 5 seconds";
    else if (type == 2)
        s = "You lost!\nResetting game in 5 seconds";
    textSize(style.fontSize);
    text(s, SIZE_X / 2, SIZE_Y / 2);
    delayFrame = true;
}

// Checks whether the player needs to move and calls the corresponding action
void CheckMovement()
{
    int distX = player.x - mouseX;
    int distY = player.y - mouseY;

    if (abs(distX) >= player.r || abs(distY) >= player.r)
    {
        player.MoveTowards(distX, distY);
        return;
    }
}

// Handles further actions for all players (this includes the enemies)
void HandlePlayers()
{
    // Draw enemies and check if they overlap with the player
    for (int i = 0; i < amountOfCircles; i++)
    {
        circles[i].Display();
        if (circles[i].circlePlayerOverlap())
            OnOverlap(circles[i]);
    }
    // Draw player after the enemies to ensure we always see player on top
    player.Display();
}

// Defines what to do when a circle and a player overlap.
void OnOverlap(Circle circle)
{
    int penalty = 2;
    int rMax = circle.rMax;
    // Check whether the circle hasn't been killed yet
    if (circle.r > 0)
    {
        // Circle is bigger than or as big as player
        if (circle.r >= player.r)
        {
            // Player shrinks, circle grows
            player.r = (constrain(player.r - penalty, 0, SIZE_Y + penalty));
            player.GetD();
            circle.r = (constrain(circle.r + penalty, 0, SIZE_Y + penalty));
            circle.GetD();
        }
        else
        // Circle is smaller than player
        {
            // Player grows, circle shrinks
            player.r = (constrain(player.r + penalty, 0, SIZE_Y + penalty));
            player.GetD();
            circle.r = (constrain(circle.r - penalty, 0, SIZE_Y + penalty));
            circle.GetD();
        }
    }

}

// Defines what a circle is and can do.
// Circle objects are used to represent both enemies and players.
class Circle
{
    int x, y, r, d;
    int rMax;
    color fillColor;
    int moveSpeed = 2;

    // Constructor function, called when a new circle is created
    Circle()
    {
        // Gives the circle a random diameter
        int rMin = 20;
        rMax = 100;
        r = int(random(rMin, rMax + 1));
        GetD();

        // Set a random X position on the screen, but not off the screen.
        int randomXYMin = r;
        int randomXMax = AgarIO.SIZE_X - r;
        int randomYMax = AgarIO.SIZE_Y - r;
        x = int(random(randomXYMin, randomXMax + 1));
        y = int(random(randomXYMin, randomYMax + 1));

        // Give the circle a random color
        int greyValueMin = 100;
        int greyValueMax = 255;
        fillColor = int(random(greyValueMin, greyValueMax + 1));
    }

    // Get the diameter from the radius
    int GetD()
    {
        return d = 2 * r;
    }

    // Moves this circle towards the inputted distance
    void MoveTowards(int distX, int distY)
    {
        if (distX < 0)
            x += moveSpeed;
        else if (distX > 0)
            x -= moveSpeed;
        if (distY < 0)
            y += moveSpeed;
        else if (distY > 0)
            y -= moveSpeed;
    }

    // Checks whether this circle and the player circle overlap.
    // Returns true if it does, and false if it doesn't.
    Boolean circlePlayerOverlap()
    {
        int dX = player.x - x;
        int dY = player.y - y;
        float dist = sqrt(dX * dX + dY * dY);
        if (dist - player.r - r > 0)
            return false;
        return true;
    }

    // Draws this circle
    void Display()
    {
        fill(fillColor);
        ellipse(x, y, d, d);
    }
}

// Holds our styling options
class Style
{
    color backgroundColor = 0;
    color textColor = 255;
    int fontSize = 30;
}