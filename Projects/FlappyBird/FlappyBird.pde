// A processing implementation of the popular mobile game
// 'Flappy Bird' for HvA's Programming Course.
// This game is designed for a 9:16 aspect ratio (vertical window)


Backdrop backdrop = new Backdrop();

final static int SIZE_X = 1080;
final static int SIZE_Y = 1920;

Boolean onRight = false;

void settings()
{
    size(SIZE_X, SIZE_Y);
}

void setup()
{
    rectMode(CENTER);
    ellipseMode(CENTER);
}

// Gets called to draw every single frame of our game.
void draw()
{
    // if (onRight == false)
    // {
    //     surface.setLocation(int(SIZE_X * 2.5),0);
    //     onRight = true;
    // }
    backdrop.Display();
}

class Backdrop
{
    Style style;
    Cloud cloud1, cloud2, cloud3;

    
    Pyramid[] pyramids;

    Backdrop()
    {
        style = new Style();
        cloud1 = new Cloud(SIZE_X / 4, SIZE_Y / 16, SIZE_X / 5, 3, 2, style.cloudColor1);
        cloud2 = new Cloud(SIZE_X - SIZE_X / 8, SIZE_Y / 20, SIZE_X / 6, 3, 2, style.cloudColor2);
        cloud3 = new Cloud(SIZE_X - SIZE_X / 3, SIZE_Y / 10, SIZE_X / 5, 4, 2, style.cloudColor3);
    
        int amountOfPyramids = 3;
        pyramids = new Pyramid[amountOfPyramids];

        CreatePyramids();
    }
    
    void Display()
    {
        background(style.backgroundColor);
        DrawClouds();
        DrawGround();
        DrawPyramids();
    }

    void DrawGround()
    {
        fill(style.groundColor);
        float height = SIZE_Y / 3;
        rect(SIZE_X / 2, SIZE_Y - height / 2, SIZE_X, height);
    }

    void DrawClouds()
    {
        cloud1.Display(); 
        cloud2.Display();
        cloud3.Display();
    }

    // Draws our pyramids.
    void DrawPyramids()
    {
        for (int i = 0; i < pyramids.length; i++)
        {
            Pyramid p = pyramids[i];
            p.Display();
        }
    }

    // Creates our pyramid objects
    void CreatePyramids()
    {
        // Start at the left of the screen, draw a triangle
        // with a width of SIZE_X / 3
        float x1 = 0;
        float y1 = SIZE_Y - SIZE_Y / 3;

        float x2 = SIZE_X / 3;
        float y2 = SIZE_Y - SIZE_Y / 3;

        float x3 = SIZE_X / 6;
        float y3 = y1 - (SIZE_X / 3) * .75;

        float dx = x2;

        for (int i = 0; i < pyramids.length; i++)
        {
            pyramids[i] = new Pyramid(x1, y1, x2, y2, x3, y3, style.pyramidColor);
            
            // Shift to the right of the previous pyramid
            x1 += dx; 
            x2 += dx;
            x3 += dx;
        }
    }

    class Pyramid
    {
        float x1, x2, x3;
        float y1, y2, y3;

        color pyramidColor;

        Pyramid(float _x1, float _y1, float _x2, float _y2, float _x3, float _y3, color _pyramidColor)
        {
            x1 = _x1;
            y1 = _y1;
            x2 = _x2;
            y2 = _y2;
            x3 = _x3;
            y3 = _y3;
            pyramidColor = _pyramidColor;
        }

        // Draws this pyramid
        void Display()
        {
            fill(pyramidColor);
            triangle(x1, y1, x2, y2, x3, y3);
        }

    }

    class Cloud
    {
        float x, y, d;
        int amountX;
        int amountY;
        color cloudColor;

        Cloud(float _x, float _y, float _d, int _amountX, int _amountY, color _cloudColor)
        {
            x = _x;
            y = _y;
            d = _d;
            amountX = _amountX;
            amountY = _amountY;
            cloudColor = _cloudColor;
        }

        // Draws a cloud object consisting of a number
        // of ellipses
        void Display()
        {
            fill(cloudColor); 
            noStroke();
            ellipseMode(CENTER);
            float dx = d * .75;
            float dy = d * .5;

            float halfWidth = dx * amountX / 2;
            float xStart = x - halfWidth;
            float xEnd = x + halfWidth;

            float yEnd = y + dy * amountY;
            for (float yPos = y; yPos < yEnd; yPos += dy)
            {
                for (float xPos = xStart; xPos < xEnd; xPos += dx)
                {
                    ellipse(xPos, yPos, d, d);
                }
                xStart += d / 4;
            }
        }
    }

    class Cactus
    {

    }

    class Style
    {
        color groundColor = color(245, 197, 66);
        color backgroundColor = color(56, 114, 255);
        color cloudColor1 = 205;
        color cloudColor2 = 186;
        color cloudColor3 = 225;
        color pyramidColor = color(226, 171, 104);
    }
}
