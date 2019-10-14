class Invader
{
    int x;
    int y;

    PImage invaderGraphic;

    Invader(int _x, int _y)
    {
        x = _x;
        y = _y;
        invaderGraphic = loadImage("enemy.png");
        invaderGraphic.resize(SIZE_X / 25, 0);
    }

    void display()
    {
        image(invaderGraphic, x, y);
    }
}