class Bullet
{
    PVector pos, dir;
    int w, h;

    int numBounces;

    Bullet(PVector _pos, PVector _dir)
    {
        pos = _pos;
        dir = _dir;
        w = 25;
        h = 100;
    }

    Boolean hitEdge()
    {
        if (pos.y > height / 2)
        {
            if (pos.y + h / 2 >= height)
            {
                reverseYDir();
                return true;
            }
        }
        else
        {
            if (pos.y + h / 2 <= 0)
            {
                reverseYDir();
                return true;
            }
        }
        if (pos.x > width / 2)
        {
            if (pos.x + h / 2 >= width)
            {
                reverseXDir();
                return true;
            }
        }
        else
        {
            if (pos.x - h / 2 <= 0)
            {
                reverseXDir();
                return true;
            }
        }
        return false;
    }

    void reverseYDir()
    {
        dir.y *= -1;
        numBounces++;
    }

    void reverseXDir()
    {
        dir.x *= -1;
        numBounces++;
    }

    void move()
    {
        pos = PVector.sub(pos, dir);
    }

    void show()
    {
        translate(pos.x, pos.y);
        rotate(dir.heading());
        rect(0, 0, w, h);
        rotate(-dir.heading());
        translate(-pos.x, -pos.y);
    }
}