class StartMenu
{
    Style style = new Style();
    Slider slider = new Slider(SIZE_X / 2, SIZE_Y / 2);

    int gridSizeMin = 3;
    int gridSizeMax = 10;


    StartMenu()
    {
    }

    void Display()
    {
        background(0);
        fill(255);
        textSize(style.fontSize);
        text("Please choose the grid size you want to play at by inputting a number below:", SIZE_X / 2, SIZE_Y / 3);
        slider.Display();
    }

    class Slider
    {
        float x, y, w, h;
        Slider(float _x, float _y)
        {
            w = SIZE_X / style.rSliderWidth;
            h = SIZE_Y / style.rSliderHeight;
            x = _x;
            y = _y;
        }

        void Display()
        {
            fill(style.sliderBarColor);
            rect(x, y, w, h);
        }
    }

    class Style
    {
        int fontSize = 30;

        color sliderBarColor = color(153, 153, 153);

        // Relative (r) heights and widths
        // rExampleName would be used as: (SIZE_X or SIZE_Y) / rEXampleName
        int rSliderHeight = 32;
        int rSliderWidth = 4;
    }

}