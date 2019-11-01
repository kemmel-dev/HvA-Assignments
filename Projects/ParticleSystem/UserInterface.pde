class UserInterface
{
    Button[] buttons;

    void init()
    {
        buttons = new Button[6];
        int i = 0;
        int y = height - height / 6;

        String[] buttonNames = {"Fire", "Smoke", "Water", "Wood", "Rocks", "Snow"};
        color[] buttonColors = {#e31809, 35, #0000FF, #8b4513, 125, #FFFFFF};
        color textColor = 255;
        color lastTextColor = 0;

        for (int x = 0; x < width; x += width / 6)
        {
            buttons[i] = new Button(x, y, buttonNames[i], buttonColors[i]);
            i++;
        }
    }

    void draw()
    {
        for(Button b : buttons)
        {
            b.draw();
        }
    }
}