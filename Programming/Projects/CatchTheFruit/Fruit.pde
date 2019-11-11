class Fruit
{
    int x, y, r, d;
    color fruitColor;
    PImage graphic;

    Fruit(int _x, int _y)
    {
        x = _x;
        y = _y;
        r = SIZE_Y / 16;
        d = 2 * r;
        graphic = fruitImages[int(random(0, fruitImages.length))];
        graphic.resize(d, 0);
    }

    void draw()
    {
        fill(fruitColor);
        image(graphic, x, y);
    }

    // Gets called when a fruit has passed boundTop
    // Returns true if fruit has hit the basket
    // Returns false otherwise
    Boolean hitBasket()
    {
        int boundLeft = int(player.position.x - player.r);
        int boundRight = int(player.position.x + player.r);
        int boundTop = int(player.position.y - player.r / 4);

        // Make sure fruit hasn't passed basket yet
        if (y < boundTop + 5)
        {
            // If fruit is in without bounds of basket
            if (x - r / 2 > boundLeft && x + r / 2 < boundRight)
            {
                return true;
            }
        }
        return false;
    }


}