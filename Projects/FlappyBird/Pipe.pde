// A pipe consists of two parts, a top and a bottom part
// The bird can fly between these two parts, or
// hit the pipe.
class Pipe
{
    float x, y, h;
    float w = SIZE_X / 5;

    Style style = new Style();

    Pipe(float _x, float _y, float _h)
    {
        x = _x;
        y = _y;
        h = _h;
    }

    void Display()
    {
        rectMode(CORNER);
        fill(style.fillColor);
        rect(x, y, w, h);
        rectMode(CENTER);
    }

    void Move()
    {
        x -= MOVE_SPEED_X;
    }

    Boolean CheckCollision(Bird bird)
    {
        if (bird.x > x && bird.x < x + w)
        {
            if (bird.y > y && bird.y < y + h)
            {
                return true;
            }
        }
        return false;
    }

    class Style 
    {
        color fillColor = color(23, 230, 23);
    }
}