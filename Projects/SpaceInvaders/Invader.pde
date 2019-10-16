class Invader
{
    int x;
    int y;
    int halfWidth;
    int bottom;
    boolean alive = true;

    Invader(int _x, int _y)
    {
        x = _x;
        y = _y;
        halfWidth = invaderGraphic.width / 2;
        bottom = y + halfWidth;
    }

    void display()
    {
        if (alive)
        {
            image(invaderGraphic, x, y);
        }
    }
}