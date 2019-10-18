class Bullet
{
    int x, y; 
    int w = SIZE_X / 150;
    int h = SIZE_Y / 50;

    // If target exists (!= null), this bullet has hit an invader
    Hit target;

    Bullet()
    {
        y = player.y;
        x = player.x;
    }

    // See if the bullet has hit any invader
    // If true, stores a new Hit in target and returns true
    // Otherwise returns false
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
                        if (y < invader.bottom && y > invader.top)
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