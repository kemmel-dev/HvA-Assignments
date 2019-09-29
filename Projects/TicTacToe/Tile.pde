// Tiles have three types: 0 for blank, 1 for cross, 2 for circle.
class Tile
{
    int type = 0;

    float x, y, w;

    Tile(int _type, float _x, float _y, float _w)
    {
        type = _type;
        x = _x;
        y = _y;
        w = _w;
    }

    int fillcolor = 255;

    void Display()
    {
        fill(GetColor());
        rect(x,y,w,w);
    }

    // Returns true if this tile has been clicked, false otherwise.
    Boolean CheckClick(float mouseX, float mouseY)
    {
        float w_half = w / 2;
        float distX = abs(mouseX - x - w_half);
        float distY = abs(mouseY - y - w_half);

        if (distX <= w_half && distY <= w_half)
        {
            return true;
        }
        return false;
    }

    color GetColor()
    {   
        switch(type)
        {
            case 1:
                return color(255, 0, 0);
            case 2:
                return color(0, 0, 255);
            default:
                return 255;
        }
    }

    int ChangeType(int currentPlayerType)
    {
        if (type == 0)
        {
            return type = currentPlayerType;
        }
        return 0;
    }
}