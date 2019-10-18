class Invader
{
    int x;
    int y;
    int halfWidth;
    int bottom;
    int top;
    boolean alive = true;

    Invader(int _x, int _y)
    {
        x = _x;
        y = _y;
        halfWidth = invaderGraphic.width / 2;
        bottom = y + halfWidth;
        top = y - halfWidth;
    }

    void display()
    {
        if (alive)
        {
            image(invaderGraphic, x, y);
        }
    }

    void move(int _x, int _y)
    {
        x += _x;
        if (y > _y)
        {
            y += _y;
            bottom = y + halfWidth;
            top = y - halfWidth;
        }
    }
}