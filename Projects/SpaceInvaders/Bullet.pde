class Bullet
{
    int x, y; 
    int w = SIZE_X / 150;
    int h = SIZE_Y / 50;

    Hit target;

    Bullet()
    {
        y = player.y;
        x = player.x;
        target = new Hit(false, 0, 0);
    }

    boolean hit()
    {
        int i = 0;
        int j = 0;
        for (Invader[] invaders : invaderGrid)
        {
            for (Invader invader : invaders)
            {
                if (invader.alive)
                {
                    if (x > invader.x - invader.halfWidth && x < invader.x + invader.halfWidth)
                    {
                        if (y < invader.bottom)
                        {
                            target = new Hit(true, i, j);
                            return true;
                        }
                    }
                }
                j++;
            }
            j = 0;
            i++;
        }
        return false;
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