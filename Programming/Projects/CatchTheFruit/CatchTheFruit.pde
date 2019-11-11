// Treat these as constants, represent the size of the sketch
final int SIZE_X = 1920 / 2;
final int SIZE_Y = 1080 / 2;
final int PLAYER_WIDTH = SIZE_X / 8;
final int SCORE_PER_FRUIT = 100;

// Game objects
Scoreboard scoreboard = new Scoreboard();
StartMenu startMenu = new StartMenu();
GameOverScreen gameOverScreen = new GameOverScreen();
Player player;

// Dynamic list of fruits that are falling
ArrayList<Fruit> fruitList = new ArrayList<Fruit>();

// The next frame a fruit will spawn on
int nextFruitFrame;
// The delay between the fruits spawning
int fruitFrameDelay;

// Number of images
int numImages = 12;
// Names of images
String[] imageNames = {"avocado", "banana", "cherry", "citrus", "grapes", "orange", "peach", "pineapple", "plum", "raspberry", "strawberry", "watermelon"};
// Stores the images
PImage[] fruitImages = new PImage[numImages];

// Controls whether the game is being played or not
Boolean gameOver = true;

color backgroundColor = color(252, 255, 199);

// These variables can be adjusted to change the difficulty of the game:
// Amount of lives the player gets
int maxLives = 5;
int lives = maxLives;
// Location fruit spawns at
int fruitSpawnLocationY = SIZE_Y / 16;
// Velocity a fruit falls at
int fruitV = 2;

// Sets the screen size
void settings()
{
    size(SIZE_X, SIZE_Y);
}

// Called before the first iteration of draw();
void setup()
{
    // Loads in images for fruitImages
    initFruitImages();

    // Set framerate
    frameRate(50);
    // Set styling modes
    imageMode(CENTER);
    textAlign(CENTER);
    textSize(32);

    // Initialize the delay in seconds between each frame
    int seconds = 3;
    fruitFrameDelay = int(frameRate * seconds);
}

// Draws every frame of our game
void draw()
{
    if (drawMenus())
    {
        return;
    }
    background(backgroundColor);
    checkForFruitSpawn();
    handleFruits();
    handlePlayer();
    scoreboard.draw();
    checkForGameOver();
}

// Initializes the fruitImages array with images from the data folder
void initFruitImages()
{
    for (int i = 0; i < numImages; i++)
    {
        fruitImages[i] = loadImage(String.format("%s.png", imageNames[i]));
    }
}

// Checks whether we're supposed to draw menu's
// Draws them and returns true if true
// Else returns false
boolean drawMenus()
{
    if (gameOver)
    {
        if (gameOverScreen.shown)
        {
            gameOverScreen.draw();
            return true;
        }
        startMenu.draw();
        return true;
    }
    return false;
}

// Checks whether we need to spawn fruits
// And calls for a fruit spawn if needed
void checkForFruitSpawn()
{
    if (frameCount > nextFruitFrame)
    {
        nextFruitFrame += fruitFrameDelay;
        spawnFruit();
    }
}

// Checks whether the player has ran out of lives
// Calls onGameOver if true
void checkForGameOver()
{
    if (lives == 0)
    {
        onGameOver();
    }
}

// Handles all actions for the player
void handlePlayer()
{
    player.controller.move();
    player.draw();
}

// Initalizes or resets the game to new game state
void onNewGame()
{
    lives = 5;
    player = new Player(SIZE_X / 2, SIZE_Y - PLAYER_WIDTH);
    scoreboard.score = 0;
    gameOver = false;
    nextFruitFrame = frameCount + fruitFrameDelay;
}

// Called when the game is over
void onGameOver()
{
    // Save high score
    scoreboard.saveHighScore();
    // Set game over bools to true
    gameOverScreen.shown = true;
    gameOver = true;
}

// Spawns a fruit at a random X location between 0 + offset and SIZE_X - offset
// and adds it to fruitList
void spawnFruit()
{
    int xBoundOffset = SIZE_X / 16;
    int fruitSpawnLocationX = int(random(xBoundOffset, SIZE_X - xBoundOffset));
    fruitList.add(new Fruit(fruitSpawnLocationX, fruitSpawnLocationY));
}

// Performs all actions for each fruit each frame.
void handleFruits()
{    
    // Stores indexes of fruits to remove from fruitList
    IntList indexList = new IntList();

    // Increments after each fruit has been handled
    int i = 0;
    // For all fruits...
    for (Fruit f : fruitList)
    {
        // Move fruit down
        f.y += fruitV;
        // Show fruit
        f.draw();
        // Fruit never hits basket or ground below boundTop
        int playerTop = int(player.position.y - player.r / 4);
        if (f.y > playerTop)
        {
            if (f.hitBasket())
            {
                // Add this fruit's index to indexList
                indexList.append(i);
                // Increment score
                scoreboard.score += SCORE_PER_FRUIT;
            }
            // If fruit hit the ground, append its index for removal and punish player.
            else if (f.y > SIZE_Y + f.r)
            {
                if (lives > 0)
                {
                    lives = constrain(lives - 1, 0, maxLives);
                    indexList.append(i);
                }
            }
        }
        i++;
    }

    // After all fruits have been handled, we remove any fruits from that need to be removed.
    if (indexList.size() > 0)
    {
        for (i = 0; i < indexList.size() - 1; i++);
        {
            fruitList.remove(indexList.get(i));
        } 
    }
}

// Called on each mouseclick on the sketch
void mouseClicked()
{
    if (gameOver)
    {
        if (gameOverScreen.shown)
        {
            // Ends gameOverScreen and switch to showing StartMenu
            gameOverScreen.shown = false;
            return;
        }
        // Ends startMenu and Starts a new game
        onNewGame();
    }
}

// Called each time a key has been pressed
void keyPressed()
{
    // Notify player's playerController
    player.controller.keyPressed();
}

// Called each time a key has been released
void keyReleased()
{
    // Notify player's playerController
    player.controller.keyReleased();
}