class Backdrop
{
    Style style;

    Cloud[] clouds = new Cloud[3];
    Pyramid[] pyramids;

    private float SIZE_X_ONE_THIRD = SIZE_X / 3;
    private float SIZE_Y_ONE_THIRD = SIZE_Y / 3;

    Backdrop()
    {
        style = new Style();
        InitialiseBackgroundObjects();
    }

    void InitialiseBackgroundObjects()
    {
        // Initializes three specific clouds
        clouds[0] = new Cloud(SIZE_X / 4, SIZE_Y / 16, SIZE_X / 5, 3, 2, style.cloudColor1);
        clouds[1] = new Cloud(SIZE_X - SIZE_X / 8, SIZE_Y / 20, SIZE_X / 6, 2, 2, style.cloudColor2);
        clouds[2] = new Cloud(SIZE_X - SIZE_X_ONE_THIRD, SIZE_Y / 10, SIZE_X / 5, 4, 2, style.cloudColor3);
        InitiatePyramids();
    }
    
    void Display()
    {
        background(style.backgroundColor);
        HandleBackgroundObjects();
    }

    void HandleBackgroundObjects()
    {
        DrawSun();
        DrawGround();
        HandleClouds();
        HandlePyramids();
    }

    // Handles all the actions for each cloud
    void HandleClouds()
    {
        for (int i = 0; i < clouds.length; i++)
        {
            Cloud c = clouds[i];

            c.Move();
            c.Display();
        }
    }

    // Handles all the actions for each pyramid
    void HandlePyramids()
    {
        for (int i = 0; i < pyramids.length; i++)
        {
            Pyramid p = pyramids[i];
            p.Move();
            p.Display();
        }
    }

    // Draws the sun
    void DrawSun()
    {
        fill(style.sunColor);
        ellipse(style.sunX, style.sunY, style.sunD, style.sunD);
    }

    // Draws the ground
    void DrawGround()
    {
        fill(style.groundColor);
        float height = SIZE_Y_ONE_THIRD;
        rect(SIZE_X / 2, SIZE_Y - height / 2, SIZE_X, height);
    }

    // Creates our pyramid objects
    void InitiatePyramids()
    {
        int amountOfPyramids = 2;
        pyramids = new Pyramid[amountOfPyramids];

        // Start at the left of the screen, draw a triangle
        // with a width of SIZE_X / 3
        float x1 = 0;
        float y1 = SIZE_Y - SIZE_Y_ONE_THIRD;

        float x2 = SIZE_X_ONE_THIRD;
        float y2 = SIZE_Y - SIZE_Y_ONE_THIRD;

        float x3 = SIZE_X / 6;
        float y3 = y1 - (SIZE_X_ONE_THIRD) * .75;

        float dx = (SIZE_X_ONE_THIRD) * 2;

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

        float width;

        color pyramidColor;

        Pyramid(float _x1, float _y1, float _x2, float _y2, float _x3, float _y3, color _pyramidColor)
        {
            x1 = _x1;
            y1 = _y1;
            x2 = _x2;
            y2 = _y2;
            x3 = _x3;
            y3 = _y3;
            width = x2 - x1;
            pyramidColor = _pyramidColor;
        }

        // Draws this pyramid
        void Display()
        {
            fill(pyramidColor);
            triangle(x1, y1, x2, y2, x3, y3);
        }

        void Move()
        {
            x1 -= MOVE_SPEED_X;
            x2 -= MOVE_SPEED_X;
            x3 -= MOVE_SPEED_X;
            if (x1 < - width)
            {
                
                x1 += SIZE_X + SIZE_X_ONE_THIRD;
                x2 += SIZE_X + SIZE_X_ONE_THIRD;
                x3 += SIZE_X + SIZE_X_ONE_THIRD;
            }
        }

    }

    class Cloud
    {
        float x, y, d, dFourth, height, width, halfWidth;
        float dx, dy;
        int amountX;
        int amountY;
        color cloudColor;

        Cloud(float _x, float _y, float _d, int _amountX, int _amountY, color _cloudColor)
        {
            x = _x;
            y = _y;
            d = _d;
            dFourth = d / 4;
            amountX = _amountX;
            amountY = _amountY;
            cloudColor = _cloudColor;

            dx = d * .75;
            dy = d * .5;
            height = dy * amountY;
            width = amountX * dx;
            halfWidth = width / 2;
        }

        // Draws a cloud object consisting of a number
        // of ellipses
        void Display()
        {
            if (OnScreen())
            {
                fill(cloudColor); 
                noStroke();
                ellipseMode(CENTER);
                float xStart = x - halfWidth;
                float xEnd = x + halfWidth;
                float yEnd = y + height;
                for (float yPos = y; yPos < yEnd; yPos += dy)
                {
                    for (float xPos = xStart; xPos < xEnd; xPos += dx)
                    {
                        ellipse(xPos, yPos, d, d);
                    }
                    xStart += dFourth;
                }
            }
        }

        Boolean OnScreen()
        {
            if (x + halfWidth > 0 && x <= SIZE_Y)
            {
                return true;
            }
            return false;
        }

        void Move()
        {
            x -= MOVE_SPEED_X;
            if (x < - width)
            {
                x = SIZE_X + width + random(0, SIZE_X);
            }
        }
    }

    class Style
    {
        color groundColor = color(245, 197, 66);
        color backgroundColor = color(56, 114, 255);
        color cloudColor1 = 205;
        color cloudColor2 = 186;
        color cloudColor3 = 225;
        color pyramidColor = color(226, 171, 104);
        color sunColor = color(253, 204, 29);
        float sunX = SIZE_X - SIZE_X / 8;
        float sunY = SIZE_Y / 16;
        float sunD = SIZE_X / 8;
    }
}
