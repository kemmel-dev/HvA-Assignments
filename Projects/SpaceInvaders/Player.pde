class Player
{

    PImage shipGraphic;
    
    int x;
    int y;

    Player()
    {
        x = SIZE_X / 2;
        y = SIZE_Y - SIZE_Y / 8;
        shipGraphic = loadImage("ship.png");
        shipGraphic.resize(SIZE_X / 25, 0);
    }

    void display()
    {
        image(shipGraphic, x, y);
    }

    void shoot()
    {
        bulletList.add(new Bullet());
    }
}