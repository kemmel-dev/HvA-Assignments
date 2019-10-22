class Scoreboard
{
    long score = 0;
    long highScore = 0;

    float xDuringGame = SIZE_X / 10;
    float yDuringGame = SIZE_Y / 10;

    float xGameOver = SIZE_X / 2;
    float yGameOVer = SIZE_Y / 2 + SIZE_Y / 8;

    void draw()
    {
        if (gameOver)
        {
            fill(255);
            textAlign(CENTER);
            text(String.format("Score: %d\nHigh Score: %d", score, highScore), xGameOver, yGameOVer);
        }
        else 
        {
            fill(0);
            textAlign(LEFT);
            text(String.format("Score: %d\nLives: %d", score, lives), xDuringGame, yDuringGame);
        }
       
    }

    void saveHighScore()
    {
        if (score > highScore)
        {
            highScore = score;
        }
    }
}