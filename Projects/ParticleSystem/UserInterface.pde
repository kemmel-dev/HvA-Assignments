class UserInterface
{
    Button[] buttons;

    int distFromTop;

    void init()
    {
        buttons = new Button[6];
        int i = 0;
        int y = height - height / 6;
        distFromTop = y;

        String[] buttonNames = {"Fire", "Smoke", "Water", "Wood", "Rocks", "Snow"};
        color[] buttonColors = {#e31809, 35, #0000FF, #8b4513, 125, #FFFFFF};
        color textColor = 255;
        color lastTextColor = 0;

        color white = 255;
        color black = 0;

        for (int x = 0; x < width; x += width / 6)
        {
            buttons[i] = new Button(x, y, buttonNames[i], buttonColors[i], white);
            i++;
        }
        buttons[buttons.length - 1].textColor = 0;
    }

    void draw()
    {
        for(Button b : buttons)
        {
            b.draw();
        }
    }

    void mousePressed()
    {
        for(Button b : buttons)
        {
            if (b.clicked())
            {
                setPenType(b.name);
            }
        }
    }
}