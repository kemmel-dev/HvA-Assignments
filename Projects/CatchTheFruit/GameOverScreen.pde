class GameOverScreen
{
    int textX = SIZE_X / 2;
    int textY = SIZE_Y / 4;

    color backGroundColor = 0;

    Boolean shown = false;

    void draw()
    {
        textAlign(CENTER);
        background(backGroundColor);
        fill(255);
        text("Game Over!\n\n\n\n\n\nClick anywhere on the screen to continue.", textX, textY);
        scoreboard.draw();
    }
}