class StartMenu
{

    String gameName = "Catch The Fruit";

    int textX = SIZE_X / 2;
    int textY = SIZE_Y / 2;

    color backGroundColor = 0;

    void draw()
    {
        background(backGroundColor);
        text(String.format("Welcome to %s!\nTo start, please click anywhere on the screen.", gameName), textX, textY);
    }
}