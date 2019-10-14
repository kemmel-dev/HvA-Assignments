class Bullet
{
    int x, y;

    Bullet()
    {
        y = player.y;
        x = player.x;
    }

    void display()
    {
        rect(x, y, 5, 10);
    }

    void move()
    {
        y -= BULLET_SPEED;
    }
}