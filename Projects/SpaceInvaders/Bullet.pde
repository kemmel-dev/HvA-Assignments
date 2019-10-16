class Bullet
{
    int x, y; 
    int w = SIZE_X / 150;
    int h = SIZE_Y / 50;

    Bullet()
    {
        y = player.y;
        x = player.x;
    }

    void display()
    {
        rect(x, y, w, h);
    }

    void move()
    {
        y -= BULLET_SPEED;
    }
}