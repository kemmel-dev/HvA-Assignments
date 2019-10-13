class Scoreboard
{
    int score = 0;
    int lastScore = 0;
    int highScore = 0;

    float x = SIZE_X / 10;
    float y = SIZE_Y / 10;

    void Display()
    {
        fill(255);
        textAlign(LEFT);
        if (gameOver)
        {
            text(String.format("Score: %d\nLast Score: %d", score, lastScore), x, y);
        }
        else 
        {
            text(String.format("Score: %d", score), x, y);
        }
       
    }

    void SaveHighScore()
    {
        if (score > highScore)
        {
            highScore = score;
        }
        lastScore = score;
    }
}