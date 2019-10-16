// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// This is a 'serious' game which can be used as an introduction to
// a typing course for children. Letters will appear on the top of the screen
// and start falling down. The player then 'shoots' these letters by hitting
// the corresponding key on their keyboard.
// How faster the player shoots these letters, how higher their score will be.
// 
// This program was designed for a dummy exam from HvA's Programming Course.
// This program was created in under 100 minutes.
// 
// By Kamiel de Visser (500838438)
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

// Treats these as constants
// They define the sketch size
final int SIZE_X = 800;
final int SIZE_Y = 600;

// The style objects holds all our styling variables to prevent magic numbers
Style style = new Style();

// We have an array for our characters, and two arrays for their x and y positions
// respectively.
// These arrays will have the same length, so we can refer to the same variable arraysLength
char[] charArray = {'a', 'b', 'd', 'f', 'g', 'h', 'j', 'k', 'l'};
int arraysLength = charArray.length;
int[] yPosArray = new int[arraysLength];
int[] xPosArray = new int[arraysLength];

// Distance between our characters.
int lettersStart = SIZE_X / 8;
int lettersDistance = (SIZE_X - lettersStart) / arraysLength;

// Stores what score the user currently has.
long score = 0L;

// Sets up the size of our sketch window
void settings()
{
    size(SIZE_X, SIZE_Y);
}

// Holds function calls that we need to call before the first iteration of draw()
void setup()
{
    initPosArrays();
    textSize(style.textSize);
    rectMode(CORNER);
}

// Handles each frame of our game
void draw()
{
    background(style.bgColor);
    handleLetters();
    showScore();
}

// Initializes our yPos array with random y positions
void initPosArrays()
{
    int x = lettersStart;
    // Sets a random value between (and including) yMin and yMax
    for (int i = 0; i < arraysLength; i++)
    {
        // Want to include yMax so add 1
        yPosArray[i] = getRandomYPos();
        xPosArray[i] = x;
        x += lettersDistance;
    }
}

// Handles all the action for each letters each time it's called.
void handleLetters()
{
    fill(style.textColor);
    textAlign(CENTER);
    // First letter gets drawn on start position
    int x = lettersStart;
    for (int i = 0; i < arraysLength; i++)
    {
        // Get the character and it's y position
        char c = charArray[i];
        int y = yPosArray[i];
        
        // Display the letter if we need to
        if (y > 0)
        {
            text(c, x, y);
        }
        // Drop the current letter down a pixel
        yPosArray[i] += 1;
        // If letter has now dropped below the screen
        if (y > SIZE_Y)
        {
            letterDropped(i);
        }
        // Next letter gets placed to the right
        x += lettersDistance;
    }
}

// Applies the corresponding penalty and reset the letter
// Gets called when a letter drops below the screen
void letterDropped(int letterIndex)
{
    yPosArray[letterIndex] = getRandomYPos();
    int penalty = 1000;
    score -= penalty;
    if (score < 0)
    {
        score = 0;
    }
}

// Is the letter on letterIndex currently on the screen?
// Returns true if so, false otherwise.
boolean isLetterOnScreen(int letterIndex)
{
    if (yPosArray[letterIndex] > 0)
    {
        return true;
    }
    return false;
}

// Called whenever a key on the keyboard is pressed by the user
void keyPressed()
{
    checkForLetterShot();
}

// Checks whether a letter has been shot, and then shoots it.
void checkForLetterShot()
{
    for (int i = 0; i < arraysLength; i++)
    {
        // Get letter
        char c = charArray[i];
        // if letter is shot
        if (key == c && isLetterOnScreen(i))
        {
            shootLetter(i);
            return;
        }
    }
}

// Shoots the letter on index letterIndex
void shootLetter(int letterIndex)
{
    // Increase score by y position of letter
    int points = yPosArray[letterIndex];
    score += points;
    drawShot(letterIndex);
    // Letter gets a new position
    yPosArray[letterIndex] = getRandomYPos();
}

// Draws the shot
void drawShot(int letterIndex)
{
    // Draws a laser from the bottom of the screen to the letter shot
    fill(style.laserColor);
    int y = yPosArray[letterIndex];
    rect(xPosArray[letterIndex], y, 10, SIZE_Y - y);
    // And an explosion at the position of the letter shot
    fill(style.explosionColor);
    int explosionSize = style.explosionSize;
    ellipse(xPosArray[letterIndex], yPosArray[letterIndex], explosionSize, explosionSize);
}

// Displays the score
void showScore()
{
    textAlign(LEFT);
    fill(style.scoreColor);
    text(String.format("Score: %d", score), style.scoreX, style.scoreY); 
}

// Holds all styling options for our game
class Style
{
    color bgColor = 0; 
    
    int textSize = 40;
    color textColor = 255;

    int explosionSize = 200;
    color explosionColor = color(255, 136, 0);

    color laserColor = color(255, 0, 0);

    int scoreX = SIZE_X / 12;
    int scoreY = SIZE_Y / 8;
    color scoreColor = color(255, 136, 255);
}