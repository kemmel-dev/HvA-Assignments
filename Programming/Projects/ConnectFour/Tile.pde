// Tiles have three types: 0 for blank, 1 for cross, 2 for circle.
class Tile
{
    Boolean full = false;
    float x, y, w, wHalf;

    Style style = new Style();

    Chip chipHere;

    Tile(float _x, float _y, float _w)
    {
        x = _x;
        y = _y;
        w = _w;
        wHalf = w / 2;
    }

    int fillcolor = 255;

    void Display()
    {
        fill(style.fillColor);
        rect(x,y,w,w);
    }

    // Returns true if this tile has been clicked, false otherwise.
    Boolean CheckClick(float mouseX, float mouseY)
    {
        float wHalf = w / 2;
        float distX = abs(mouseX - x - wHalf);
        float distY = abs(mouseY - y - wHalf);

        if (distX <= wHalf && distY <= wHalf)
        {
            return true;
        }
        return false;
    }

    Boolean Occupy(Chip chip)
    {
        if (chip != null)
        {
            chipHere = chip;
            return full = true;
        }
        return full = false;
    }

    class Style
    {
        color fillColor = 255;
    }
}