class Player
{
    
    int x;
    int y;
    int moveSpeed = 7;
    int moveDir = 0;

    Player()
    {
        x = SIZE_X / 2;
        y = SIZE_Y - SIZE_Y / 8;
    }

    void display()
    {
        image(shipGraphic, x, y);
    }

    void shoot()
    {
        bulletList.add(new Bullet());
    }

    void move()
    {
        if (leftDown)
        {
            x = constrain(x - moveSpeed, 0, SIZE_X);
        }
        if (rightDown)
        {
            x = constrain(x + moveSpeed, 0, SIZE_X);
        }
    }
}