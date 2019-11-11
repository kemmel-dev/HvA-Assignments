class Fire implements Particle
{
    PVector pos;
    String type;
    
    float mass = 0.105;

    int r, d;

    PVector velocity = new PVector(0, mass * GRAVITY);

    Boolean moving = true;

    Fire(PVector _pos, String _type)
    {
        pos = _pos;
        type = _type;
        r = 3;
        d = 2 * r;
    }

    int getR()
    {
        return r;
    }

    PVector getPos()
    {
        return pos;
    }

    void move()
    {
        if (moving)
        {
            pos.add(velocity);
            if (pos.y > ui.distFromTop)
            {
                pos.y = ui.distFromTop;
            }
        }
    }

    void display()
    {
        fill(color(255,0,0));
        circle(pos.x, pos.y, d);
    }
}