class Chip
{
    int type = 0;
    float fallSpeed = 5;
    float x, y, yCurrent, w;

    Style style;
    Boolean falling = true;

    Chip(int currentPlayerType, float _x, float _y, float _w)
    {
        type = currentPlayerType;
        x = _x;
        y = _y;
        yCurrent = SIZE_Y / 16;
        w = _w;
        style = new Style();
        style.fillColor = style.GetColor(type);
    }

    void Display()
    {
        fill(style.fillColor);
        ellipse(x, yCurrent, w, w);
    }

    class Style
    {
        color fillColor;

        color GetColor(int type)
        {
            switch(type)
            {
                case 1:
                    return color(255,0,0);
                default:
                    return color(0,0,255);
            }
        }
    }
}